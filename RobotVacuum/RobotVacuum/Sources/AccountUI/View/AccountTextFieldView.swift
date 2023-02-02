import Common
import CountryPicker
import UIKit

@objc public protocol AccountTextFieldViewDelegate: NSObjectProtocol {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
    func textFieldShouldClear(_ textField: UITextField)
    @objc optional func textFieldDidBeginEditing(_ textField: UITextField)
    @objc optional func textFieldShouldReturn(_ textField: UITextField)
}

class AccountTextFieldView: UIView {
    public weak var delegate: AccountTextFieldViewDelegate?

    var containView: UIView!
    var iconImg = UIImageView()
    var areaCodeButton: UIButton!
    var areaCodeSpaceView: UIView!
    public var accountTextField: UITextField!
    public var isPhone = true
    public var countryCode = "1"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = contentBackgroundColor
        layer.cornerRadius = 16
        setupSubviews()
    }

    func setupSubviews() {
        addContentView()
        addAccountViews()
        addStackView()
        hiddenAreaCode(isHidden: true)
    }

    func addContentView() {
        containView = UIView()
        containView.backgroundColor = contentBackgroundColor
        addSubview(containView)
        containView.layer.cornerRadius = 16
        containView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func addAccountViews() {
        iconImg = UIImageView()
        iconImg.image = AccountUI.Asset.userIcon.image
        containView.addSubview(iconImg)
        iconImg.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(24)
        }

        areaCodeButton = UIButton(type: .system)
        areaCodeButton.setTitleColor(mainTitleColor, for: .normal)
        areaCodeButton.setImage(AccountUI.Asset.arrowDown.image, for: .normal)
        areaCodeButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        areaCodeButton.semanticContentAttribute = .forceRightToLeft
        areaCodeButton.addTarget(self, action: #selector(areaCodeButtonTap), for: .touchUpInside)

        areaCodeSpaceView = UIView()
        areaCodeSpaceView.snp.makeConstraints { make in
            make.width.equalTo(24)
        }

        let lineView = UIView()
        lineView.backgroundColor = subTitleColor
        areaCodeSpaceView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(22)
        }

        accountTextField = UITextField()
        accountTextField.delegate = self
        accountTextField.font = UIFont.systemFont(ofSize: 16)
        accountTextField.textColor = mainTitleColor
        accountTextField.borderStyle = .none
        accountTextField.clearButtonMode = .whileEditing
        let key = NSAttributedString.Key.font
        let font = UIFont.systemFont(ofSize: 16)
        let atttibutes = [key: font, .foregroundColor: unEnableTitleColor]
        accountTextField.attributedPlaceholder = NSAttributedString(string: L10n.Account.hint,
                                                                    attributes: atttibutes)
        accountTextField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        accountTextField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }

    func addStackView() {
        let accountStackView = UIStackView(arrangedSubviews: [areaCodeButton, areaCodeSpaceView, accountTextField])
        accountStackView.axis = .horizontal
        accountStackView.alignment = .fill
        accountStackView.distribution = .fill
        accountStackView.spacing = 0

        containView.addSubview(accountStackView)
        accountStackView.snp.makeConstraints { make in
            make.left.equalTo(iconImg.snp.right).offset(12)
            make.right.equalToSuperview().offset(-16)
            make.top.bottom.equalToSuperview()
        }
    }

    @objc func areaCodeButtonTap() {
        CountryPickerWithSectionViewController.presentController(
            on: UIViewController.currentViewController() ?? UIViewController(),
            configuration: { countryController in
                countryController.configuration.isCountryFlagHidden = true
                countryController.configuration.isCountryDialHidden = false
                countryController.configuration.labelFont = UIFont.systemFont(ofSize: 16, weight: .medium)
                countryController.configuration.labelColor = mainTitleColor
            }, handler: { [weak self] country in
                self?.countryCode = country.dialingCode ?? ""
                print("dialingCode is :\(String(describing: country.dialingCode))")
                self?.setAreaCode(code: country.digitCountrycode ?? "")
            }
        )
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountTextFieldView {
    public func setAreaCode(code: String) {
        if code.hasPrefix("+") {
            areaCodeButton.setTitle(code, for: .normal)
        } else {
            areaCodeButton.setTitle("+\(code) ", for: .normal)
        }
    }

    func checkIsShowAreaCode(str: String?) {
        checkIsPhone(str: str)
        if let str = str, str.count >= 7, isPhone {
            hiddenAreaCode(isHidden: false)
            setAreaCode(code: countryCode)
        } else {
            hiddenAreaCode(isHidden: true)
        }
    }

    private func hiddenAreaCode(isHidden: Bool) {
        areaCodeButton.isHidden = isHidden
        areaCodeSpaceView.isHidden = isHidden
    }

    private func checkIsPhone(str: String?) {
        if let str = str, !isPureNumber(str) {
            isPhone = false
        } else {
            isPhone = true
        }
    }

    private func isPureNumber(_ input: String) -> Bool {
        let numberEegEx = "^[0-9]*$"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberEegEx)
        return numberTest.evaluate(with: input)
    }
}

extension AccountTextFieldView: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldClear(textField)
        return true
    }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        delegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.checkIsShowAreaCode(str: textField.text)
        }
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldReturn?(textField)
        textField.resignFirstResponder()
        return true
    }
}
