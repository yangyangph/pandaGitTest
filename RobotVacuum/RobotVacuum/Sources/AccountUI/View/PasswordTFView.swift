import Common
import UIKit

class PasswordTFView: UIView {
    var containView: UIView!
    var leftImage: UIImageView!
    var passwordTextField: UITextField!
    var rightButton: UIButton!
    weak var delegate: AccountTextFieldViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 16
        setupSubViews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubViews() {
        containView = UIView()
        containView.backgroundColor = contentBackgroundColor
        addSubview(containView)
        containView.layer.cornerRadius = 16
        containView.layer.masksToBounds = true
        containView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        leftImage = UIImageView()
        leftImage.image = AccountUI.Asset.lockIcon.image
        containView.addSubview(leftImage)
        leftImage.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(24)
        }

        rightButton = UIButton(type: .custom)
        rightButton.setImage(AccountUI.Asset.eyeIcon.image, for: .normal)
        containView.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview()
            make.width.equalTo(56)
        }
        rightButton.addTarget(self, action: #selector(rightButtonTap), for: .touchUpInside)

        passwordTextField = UITextField()
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.textColor = mainTitleColor
        passwordTextField.borderStyle = .none
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                          .foregroundColor: unEnableTitleColor]
        passwordTextField.attributedPlaceholder = NSAttributedString(string: L10n.Account.Password.hint,
                                                                     attributes: attributes)
        containView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.equalTo(leftImage.snp.right).offset(16)
            make.right.equalTo(rightButton.snp.left)
            make.top.bottom.equalToSuperview()
        }
    }

    @objc func rightButtonTap() {
        rightButton.isSelected = !rightButton.isSelected
        passwordTextField.isSecureTextEntry = !rightButton.isSelected
    }

    public func checkPasswordLengthCompliance() -> Bool {
        guard let text = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              text.count >= 6, text.count <= 14 else {
            return false
        }
        return true
    }
}

extension PasswordTFView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldClear(textField)
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if string.count > 0 {
            if !checkPasswordRule(str: string) {
                return false
            }
        }
        delegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldReturn?(textField)
        textField.resignFirstResponder()
        return true
    }

    private func checkPasswordRule(str: String) -> Bool {
        let pwd = "^[0-9A-Za-z]"
        let regextestpwd = NSPredicate(format: "SELF MATCHES %@", pwd)
        if regextestpwd.evaluate(with: str) {
            return true
        } else {
            return false
        }
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
