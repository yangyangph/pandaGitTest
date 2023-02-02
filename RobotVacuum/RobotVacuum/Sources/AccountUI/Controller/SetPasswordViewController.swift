import Common
import UIKit

class SetPasswordViewController: BaseViewController {
    var showType: RegisterVCShowType = .register
    var titleLabel = UILabel()
    var passwordTFView: PasswordTFView!
    var checkPasswordTFView: PasswordTFView!
    var passwordRuleLabel: UILabel!
    var completeButton: UIButton!
    var bottomImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    func setupSubviews() {
        addPasswordAndCheckViews()
        addRlueLabelAndButtonViews()
    }

    func addPasswordAndCheckViews() {
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

        passwordTFView = PasswordTFView()
        passwordTFView.delegate = self
        view.addSubview(passwordTFView)
        passwordTFView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(56)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }

        checkPasswordTFView = PasswordTFView()
        checkPasswordTFView.delegate = self
        checkPasswordTFView.passwordTextField.placeholder = L10n.Account.Password.Again.hint
        view.addSubview(checkPasswordTFView)
        checkPasswordTFView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(56)
            make.top.equalTo(passwordTFView.snp.bottom).offset(12)
        }
    }

    func addRlueLabelAndButtonViews() {
        passwordRuleLabel = UILabel()
        view.addSubview(passwordRuleLabel)
        passwordRuleLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(checkPasswordTFView.snp.bottom).offset(12)
        }
        passwordRuleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        passwordRuleLabel.textColor = subTitleColor
        passwordRuleLabel.numberOfLines = 0
        passwordRuleLabel.textAlignment = .left
        passwordRuleLabel.text = L10n.Account.Password.rules
        passwordRuleLabel.lineSpace = 5

        completeButton = UIButton()
        view.addSubview(completeButton)
        completeButton.backgroundColor = nextBtnBgColor
        completeButton.setTitle(L10n.Account.Signup.complete, for: .normal)
        completeButton.setTitleColor(privacyViewBgColor, for: .normal)
        completeButton.layer.cornerRadius = 16
        completeButton.isUserInteractionEnabled = false
        completeButton.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(56)
            make.top.equalTo(passwordRuleLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        completeButton.addTarget(self, action: #selector(clickLoginBtn(sender:)), for: .touchUpInside)

        bottomImg = UIImageView(frame: CGRect.zero)
        bottomImg.image = AccountUI.Asset.halfBase.image
        view.addSubview(bottomImg)
        bottomImg.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(201)
        }
    }

    @objc func clickLoginBtn(sender: UIButton) {
        print("clickLoginBtn sender:\(sender)")
        view.endEditing(true)
        let length1 = passwordTFView.passwordTextField.text?.count ?? 0
        let length2 = checkPasswordTFView.passwordTextField.text?.count ?? 0
        /// 两次密码输入不一致
        if passwordTFView.passwordTextField.text != checkPasswordTFView.passwordTextField.text {
            addErrorTips(tip: L10n.Account.Inconsistent.Password.Entered.twice)
        } else if (length1 > 14 || length1 < 6) || (length2 > 14 || length2 < 6) {
            // 密码在6-14位数字、字母和特殊字符
            addErrorTips(tip: L10n.Account.Password.error)
        } else { // 输入正确
            removeErrorTips(tip: L10n.Account.Password.rules)
            if showType == .register { /// 注册账号
               
            } else { /// 忘记密码
                
            }
        }
    }

    
    func validateCompleteBtn() {
        completeButton.isUserInteractionEnabled = true
        completeButton.backgroundColor = tabbarTintColor
        completeButton.setTitleColor(contentBackgroundColor, for: .normal)
    }

    func invalidateCompleteBtn() {
        completeButton.isUserInteractionEnabled = false
        completeButton.backgroundColor = nextBtnBgColor
        completeButton.setTitleColor(privacyViewBgColor, for: .normal)
    }

    func addErrorTips(tip: String) {
        passwordTFView.layer.borderColor = errorBorderColor.cgColor
        passwordTFView.layer.borderWidth = 1
        checkPasswordTFView.layer.borderColor = errorBorderColor.cgColor
        checkPasswordTFView.layer.borderWidth = 1
        passwordRuleLabel.textColor = errorBorderColor
        passwordRuleLabel.text = tip
    }

    func removeErrorTips(tip: String) {
        passwordTFView.layer.borderColor = contentBackgroundColor.cgColor
        passwordTFView.layer.borderWidth = 0
        checkPasswordTFView.layer.borderColor = contentBackgroundColor.cgColor
        checkPasswordTFView.layer.borderWidth = 0
        passwordRuleLabel.textColor = subTitleColor
        passwordRuleLabel.text = tip
    }
}

extension SetPasswordViewController: AccountTextFieldViewDelegate {
    func textFieldShouldClear(_: UITextField) {
        print("textFieldShouldClear")
        setCompleteBtnStatus()
    }

    func textFieldDidBeginEditing(_: UITextField) {
        print(" AccountTextFieldViewDelegate textFieldDidBeginEditing ")
    }

    func textField(_: UITextField, shouldChangeCharactersIn _: NSRange,
                   replacementString _: String) {
        setCompleteBtnStatus()
    }

    func setCompleteBtnStatus() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            print(" AccountTextFieldViewDelegate text shouldChangeCharactersIn ")
            if (self.passwordTFView.passwordTextField.text?.count ?? 0) > 0 &&
                (self.checkPasswordTFView.passwordTextField.text?.count ?? 0) > 0 {
                self.validateCompleteBtn()
            } else {
                self.invalidateCompleteBtn()
            }
        }
    }
}
