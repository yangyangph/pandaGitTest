import Common
import UIKit

enum CaptchaTextFieldViewStatusType {
    case `default`, countDown
}

class CaptchaTextFieldView: UIView {
    var containView: UIView!
    var iconImg: UIImageView!
    var captchaField: UITextField!
    var verifyBtn: UIButton!
    var countDownLabel: UILabel!
    var countDownSeconds = 60
    var timer: Timer?
    var rightButtonTapBlock: (() -> Void)?
    weak var delegate: AccountTextFieldViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = contentBackgroundColor
        layer.cornerRadius = 16
        addImgAndButtonViews()
        addFieldAndLabelViews()
    }

    func addImgAndButtonViews() {
        containView = UIView()
        containView.backgroundColor = contentBackgroundColor
        addSubview(containView)
        containView.layer.cornerRadius = 16
        containView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        iconImg = UIImageView()
        containView.addSubview(iconImg)
        iconImg.image = AccountUI.Asset.veryfyIcon.image
        iconImg.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(24)
        }

        verifyBtn = UIButton(type: .system)
        containView.addSubview(verifyBtn)
        verifyBtn.setTitle(L10n.Account.VerificationCode.get, for: .normal)
        verifyBtn.titleLabel?.textAlignment = .center
        verifyBtn.setTitleColor(verifyBtnBgColor, for: .normal)
        verifyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        verifyBtn.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
        // 验证码按钮默认不可点击,需要输入账号才能点击
        verifyBtn.isUserInteractionEnabled = false
        verifyBtn.addTarget(self, action: #selector(clickVerifyCodeBtn(sender:)), for: .touchUpInside)
    }

    func addFieldAndLabelViews() {
        captchaField = UITextField()
        containView.addSubview(captchaField)
        captchaField.delegate = self
        captchaField.placeholder = L10n.Account.VerificationCode.hint
        captchaField.font = UIFont.systemFont(ofSize: 16)
        captchaField.textColor = mainTitleColor
        captchaField.borderStyle = .none
        captchaField.clearButtonMode = .whileEditing
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                          .foregroundColor: unEnableTitleColor]
        captchaField.attributedPlaceholder = NSAttributedString(string: L10n.Account.VerificationCode.hint,
                                                                attributes: attributes)
        captchaField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        captchaField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        captchaField.snp.makeConstraints { make in
            make.left.equalTo(iconImg.snp.right).offset(12)
            make.top.bottom.equalTo(iconImg)
            make.right.equalTo(verifyBtn.snp.left)
        }

        countDownLabel = UILabel()
        countDownLabel.textAlignment = .center
        countDownLabel.font = UIFont.systemFont(ofSize: 16)
        countDownLabel.textColor = privacyTitleColor
        countDownLabel.backgroundColor = nextBtnBgColor
        countDownLabel.layer.cornerRadius = 6
        countDownLabel.layer.masksToBounds = true
        containView.addSubview(countDownLabel)
        countDownLabel.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(38)
        }
    }

    @objc func clickVerifyCodeBtn(sender _: UIButton) {
        endEditing(true)
        rightButtonTapBlock?()
    }

    func changeVerifyBtnActivity() {
        print("input textfield is :\(captchaField.text!)")
        if (captchaField.text!.count) > 0 {
            print("activeVerifyBtn")
            validateVerifyBtn()
        } else {
            print("stopVerifyBtn")
            invalidateVerifyBtn()
        }
    }

    // 验证码按钮激活可点击,字体颜色改变
    func validateVerifyBtn() {
        print("active verifyBtn")
        verifyBtn.isUserInteractionEnabled = true
        verifyBtn.setTitleColor(mainTitleColor, for: .normal)
    }

    // 验证码按钮不可点击
    func invalidateVerifyBtn() {
        print("stop verifyBtn")
        verifyBtn.isUserInteractionEnabled = false
        verifyBtn.setTitleColor(verifyBtnBgColor, for: .normal)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CaptchaTextFieldView {
    public func setStatus(status: CaptchaTextFieldViewStatusType) {
        switch status {
        case .default:
            verifyBtn.isHidden = false
            countDownLabel.isHidden = true
            deinitTimer()
        case .countDown:
            verifyBtn.isHidden = true
            countDownLabel.isHidden = false
            startCountDown()
        }
    }

    private func startCountDown() {
        countDownSeconds = 60
        countDownLabel.text = "\(countDownSeconds)"
        initTimer()
    }

    private func deinitTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func initTimer() {
        deinitTimer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction),
                                     userInfo: nil, repeats: true)
    }

    @objc private func timerAction() {
        if countDownSeconds > 0 {
            countDownSeconds -= 1
            countDownLabel.text = "\(countDownSeconds)"
        } else {
            deinitTimer()
            setStatus(status: .default)
        }
    }

    public func checkCaptchaLengthCompliance() -> Bool {
        guard let text = captchaField.text?.trimmingCharacters(in: .whitespacesAndNewlines), text.count == 4 else {
            return false
        }
        return true
    }
}

extension CaptchaTextFieldView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldClear(textField)
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        delegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
        return true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textFieldShouldReturn?(textField)
        textField.resignFirstResponder()
        return true
    }
}
