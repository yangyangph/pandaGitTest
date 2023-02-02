import Common
import UIKit

class ConfirmDeleteViewController: BaseViewController {
    var contentView: UIView!
    var passwordTFView: PasswordTFView!
    var tipLabel: UILabel!
    var deleteBtn: UIButton!
   
    var password: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.Account.delete
        view.backgroundColor = contentBackgroundColor
        setupSubViews()
    }

    func setupSubViews() {
        contentView = UIView()
        view.addSubview(contentView)
        contentView.backgroundColor = viewBackgroundColor
        contentView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(UIDevice.rv_navigationFullHeight())
        }
        passwordTFView = PasswordTFView()
        passwordTFView.delegate = self
        contentView.addSubview(passwordTFView)
        passwordTFView.containView.backgroundColor = logoutTFColor
        passwordTFView.passwordTextField.text = L10n.Account.Password.hint
        passwordTFView.passwordTextField.becomeFirstResponder()
        passwordTFView.passwordTextField.returnKeyType = .done
        passwordTFView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(56)
            make.top.equalToSuperview().offset(16)
        }
        passwordTFView.rightButtonTap()

        tipLabel = UILabel(frame: .zero)
        contentView.addSubview(tipLabel)
        tipLabel.textColor = errorBorderColor
        tipLabel.font = UIFont(name: "PingFang SC", size: 14)
        tipLabel.text = L10n.Account.Confirm.Passsword.error
        tipLabel.snp.makeConstraints { make in
            make.left.right.equalTo(passwordTFView)
            make.top.equalTo(passwordTFView.snp.bottom).offset(5)
            make.height.equalTo(20)
        }
        tipLabel.isHidden = true

        deleteBtn = UIButton(type: .custom)
        contentView.addSubview(deleteBtn)
        deleteBtn.setTitle(L10n.Account.Confirm.delete, for: .normal)
        deleteBtn.setTitleColor(privacyViewBgColor, for: .normal)
        deleteBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        deleteBtn.backgroundColor = nextBtnBgColor
        deleteBtn.layer.cornerRadius = 16
        deleteBtn.isUserInteractionEnabled = false
        deleteBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().offset(-UIDevice.rv_safeDistanceBottom() - 20)
        }
        deleteBtn.addTarget(self, action: #selector(clickDeleteBtn(_:)), for: .touchUpInside)
    }

    // 注销账号
    @objc func clickDeleteBtn(_: UIButton) {
        password = passwordTFView.passwordTextField.text ?? ""
    }

    func setPswTFViewStatus(status: Bool) {
        if status {
            passwordTFView.layer.borderColor = UIColor.clear.cgColor
            passwordTFView.layer.borderWidth = 0
            tipLabel.isHidden = true
        } else {
            passwordTFView.layer.borderColor = errorBorderColor.cgColor
            passwordTFView.layer.borderWidth = 1.0
            tipLabel.isHidden = false
        }
    }

    

}

extension ConfirmDeleteViewController: AccountTextFieldViewDelegate {
    public func textFieldShouldClear(_: UITextField) {
        print("textFieldShouldClear")
        setLogoutBtnStatus()
    }

    public func textFieldDidBeginEditing(_: UITextField) {
        print(" LoginViewController AccountTextFieldViewDelegate textFieldDidBeginEditing ")
    }

    public func textField(_: UITextField, shouldChangeCharactersIn _: NSRange,
                          replacementString _: String) {
        setLogoutBtnStatus()
    }

    public func textFieldShouldReturn(_: UITextField) {
        print("textFieldShouldReturn ---")
    }

    func setLogoutBtnStatus() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            if (self.passwordTFView.passwordTextField.text?.count ?? 0) > 0 {
                self.validateLogoutBtn()
            } else {
                self.invalidateLogoutBtn()
            }
        }
    }

    func validateLogoutBtn() {
        deleteBtn.isUserInteractionEnabled = true
        deleteBtn.backgroundColor = errorBorderColor
        deleteBtn.setTitleColor(contentBackgroundColor, for: .normal)
    }

    func invalidateLogoutBtn() {
        deleteBtn.isUserInteractionEnabled = false
        deleteBtn.backgroundColor = nextBtnBgColor
        deleteBtn.setTitleColor(privacyViewBgColor, for: .normal)
    }
}
