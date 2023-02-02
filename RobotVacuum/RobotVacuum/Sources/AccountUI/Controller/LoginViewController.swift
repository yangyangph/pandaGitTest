import Common
import UIKit

public class LoginViewController: BaseViewController {
    var titleLabel: UILabel!
    var accountView: AccountTextFieldView!
    var passwordTFView: PasswordTFView!
    var registerButton: UIButton!
    var forgetButton: UIButton!
    var loginButton: UIButton!
    var bottomImg: UIImageView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    func setupSubViews() {
        addAccountTextFieldViews()
        addAccountButtonViews()
    }

    func addAccountTextFieldViews() {
        titleLabel = UILabel(frame: CGRect.zero)
        view.addSubview(titleLabel)
        titleLabel.text = L10n.Account.User.login
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = attibuteColor
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.height.equalTo(40)
            make.left.right.equalToSuperview()
        }

        accountView = AccountTextFieldView(frame: CGRect.zero)
        view.addSubview(accountView)
        accountView.accountTextField.returnKeyType = .done
        accountView.accountTextField.keyboardType = .numbersAndPunctuation
        accountView.accountTextField.tag = 1001
        accountView.delegate = self
        accountView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.height.equalTo(56)
        }

        passwordTFView = PasswordTFView()
        passwordTFView.delegate = self
        view.addSubview(passwordTFView)
        passwordTFView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(56)
            make.top.equalTo(accountView.snp.bottom).offset(20)
        }
    }

    func addAccountButtonViews() {
        registerButton = UIButton()
        view.addSubview(registerButton)
        registerButton.setTitle(L10n.Account.User.register, for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "PingFang SC", size: 14)
        registerButton.setTitleColor(registerBtnTitleColor, for: .normal)
        registerButton.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(20)
            make.top.equalTo(passwordTFView.snp.bottom).offset(16)
            make.left.equalTo(16)
        }
        registerButton.addTarget(self, action: #selector(clickRegisterBtn(sender:)), for: .touchUpInside)

        forgetButton = UIButton()
        view.addSubview(forgetButton)
        forgetButton.setTitle(L10n.Account.Password.forget, for: .normal)
        forgetButton.titleLabel?.font = UIFont(name: "PingFang SC", size: 14)
        forgetButton.setTitleColor(registerBtnTitleColor, for: .normal)
        forgetButton.snp.makeConstraints { make in
            make.width.height.top.equalTo(registerButton)
            make.right.equalTo(-16)
        }
        forgetButton.addTarget(self, action: #selector(clickForgetBtn(sender:)), for: .touchUpInside)

        loginButton = UIButton()
        view.addSubview(loginButton)
        loginButton.backgroundColor = nextBtnBgColor
        loginButton.setTitle(L10n.Account.login, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.setTitleColor(privacyViewBgColor, for: .normal)
        loginButton.layer.cornerRadius = 16
        loginButton.isUserInteractionEnabled = false
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(56)
            make.top.equalTo(passwordTFView.snp.bottom).offset(76)
            make.centerX.equalToSuperview()
        }
        loginButton.addTarget(self, action: #selector(clickLoginBtn(sender:)), for: .touchUpInside)

        bottomImg = UIImageView(frame: CGRect.zero)
        bottomImg.image = AccountUI.Asset.halfBase.image
        view.addSubview(bottomImg)
        bottomImg.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(201)
        }
    }

    /// 登录
    @objc func clickLoginBtn(sender _: UIButton) {
        print("clickLoginBtn")
        view.endEditing(true)
        

    }

    @objc func clickRegisterBtn(sender _: UIButton) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }

    @objc func clickForgetBtn(sender _: UIButton) {
        let forgetVC = RegisterViewController()
        forgetVC.showType = .forgotPassword
        navigationController?.pushViewController(forgetVC, animated: true)
    }

    func validateLoginBtn() {
        loginButton.isUserInteractionEnabled = true
        loginButton.backgroundColor = tabbarTintColor
        loginButton.setTitleColor(contentBackgroundColor, for: .normal)
    }

    func invalidateLoginBtn() {
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = nextBtnBgColor
        loginButton.setTitleColor(privacyViewBgColor, for: .normal)
    }
}

extension LoginViewController: AccountTextFieldViewDelegate {
    public func textFieldShouldClear(_: UITextField) {
        setLoginBtnStatus()
    }

    public func textFieldDidBeginEditing(_: UITextField) {
        print(" LoginViewController AccountTextFieldViewDelegate textFieldDidBeginEditing ")
    }

    public func textField(_: UITextField, shouldChangeCharactersIn _: NSRange,
                          replacementString _: String) {
        setLoginBtnStatus()
    }

    func setLoginBtnStatus() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            if (self.accountView.accountTextField.text?.count ?? 0) > 0 &&
                (self.passwordTFView.passwordTextField.text?.count ?? 0) > 0 {
                self.validateLoginBtn()
            } else {
                self.invalidateLoginBtn()
            }
        }
    }
}
