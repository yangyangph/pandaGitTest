import Common
import UIKit

enum RegisterVCShowType {
    case register // 新用户注册
    case forgotPassword // 忘记密码
}

class RegisterViewController: BaseViewController {
    var showType: RegisterVCShowType = .register
    var titleLabel = UILabel()
    var accountView = AccountTextFieldView()
    var captchaView = CaptchaTextFieldView()
    var bottomImg = UIImageView()
    var nextBtn = UIButton()
    var isAccountCode = false
    var isVerifyCode = false
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        addTapGestureOnView()
    }

    func setupSubViews() {
        addAccountAndCodeViews()
        addNextButAndBottomImgViews()
    }

    func addAccountAndCodeViews() {
        view.addSubview(titleLabel)
        titleLabel.text = (showType == .register ? L10n.Account.User.register : L10n.Account.Password.forget)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = attibuteColor
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.height.equalTo(40)
            make.left.right.equalToSuperview()
        }

        view.addSubview(accountView)
        accountView.accountTextField.returnKeyType = .done
        accountView.accountTextField.keyboardType = .numbersAndPunctuation
        accountView.delegate = self
        accountView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.height.equalTo(56)
        }
        view.addSubview(captchaView)
        captchaView.captchaField.returnKeyType = .done
        captchaView.captchaField.keyboardType = .numbersAndPunctuation
        captchaView.delegate = self
        captchaView.snp.makeConstraints { make in
            make.left.right.height.equalTo(accountView)
            make.top.equalTo(accountView.snp.bottom).offset(20)
        }
        captchaView.setStatus(status: .default)
        captchaView.rightButtonTapBlock = {
            
        }
    }

    func addNextButAndBottomImgViews() {
        view.addSubview(nextBtn)
        nextBtn.layer.cornerRadius = 16
        nextBtn.backgroundColor = nextBtnBgColor
        nextBtn.setTitle(L10n.Account.Next.step, for: .normal)
        nextBtn.titleLabel?.textAlignment = .center
        nextBtn.setTitleColor(privacyViewBgColor, for: .normal)
        nextBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        nextBtn.isUserInteractionEnabled = false
        nextBtn.snp.makeConstraints { make in
            make.top.equalTo(captchaView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(56)
        }
        nextBtn.addTarget(self, action: #selector(clicNextBtn(sender:)), for: .touchUpInside)

        bottomImg.image = AccountUI.Asset.halfBase.image
        view.addSubview(bottomImg)
        bottomImg.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(201)
        }
    }

    func addTapGestureOnView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(clickToResignKeyBoard))
        view.addGestureRecognizer(tap)
    }

    // MARK: - 点击收起键盘

    @objc func clickToResignKeyBoard() {
        view.endEditing(true)
    }

    @objc func clicNextBtn(sender _: UIButton) {
        view.endEditing(true)
        print("clic Next Btn :\(showType)")
        if !captchaView.checkCaptchaLengthCompliance() {
            ToastView.toast(content: L10n.Account.VerificationCode.error)
            return
        }
        let nextVC = SetPasswordViewController()
        nextVC.showType = showType
        navigationController?.pushViewController(nextVC, animated: true)
    }

    // 下一步按钮可点击
    func validateNextBtn() {
        nextBtn.isUserInteractionEnabled = true
        nextBtn.backgroundColor = tabbarTintColor
        nextBtn.setTitleColor(contentBackgroundColor, for: .normal)
    }

    // 下一步按钮不可点击
    func invalidateNextBtn() {
        nextBtn.isUserInteractionEnabled = false
        nextBtn.backgroundColor = nextBtnBgColor
        nextBtn.setTitleColor(privacyViewBgColor, for: .normal)
    }
}

extension RegisterViewController: AccountTextFieldViewDelegate {
    func textFieldShouldClear(_: UITextField) {
        setNextButtonStatus()
    }

    func textFieldDidBeginEditing(_: UITextField) {
        print(" AccountTextFieldViewDelegate textFieldDidBeginEditing ")
    }

    func textField(_: UITextField, shouldChangeCharactersIn _: NSRange,
                   replacementString _: String) {
        setNextButtonStatus()
    }

    func setNextButtonStatus() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            print(" AccountTextFieldViewDelegate text shouldChangeCharactersIn ")
            if (self.accountView.accountTextField.text?.count ?? 0) > 0 {
                self.captchaView.validateVerifyBtn()
            } else {
                self.captchaView.invalidateVerifyBtn()
            }

            if (self.accountView.accountTextField.text?.count ?? 0) > 0 &&
                (self.captchaView.captchaField.text?.count ?? 0) > 0 {
                self.validateNextBtn()
            } else {
                self.invalidateNextBtn()
            }
        }
    }
}
