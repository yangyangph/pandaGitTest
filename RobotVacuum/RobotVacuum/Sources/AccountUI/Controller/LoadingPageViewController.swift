import Common
import UIKit

public class LoadingPageViewController: BaseViewController {
    var bgImage = UIImageView()
    var vacuumImg = UIImageView()
    var brandImg = UIImageView()
    var selectBtn = UIButton()
    var privacyLabel = UILabel()
    var loginBtn = UIButton()
    var registBtn = UIButton()
    var isAgree = false
    var range1: NSRange!
    var range2: NSRange!

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setHiddenBackBtn(isHidden: true)
        isAgree = false
        selectBtn.isSelected = false
        selectBtn.setBackgroundImage(AccountUI.Asset.unselectIcon.image, for: .normal)
    }

    func setupSubViews() {
        addBackImagesView()
        addPrivacyView()
        addLoginAndRegisterView()
    }

    /// 添加背景图和icon图
    func addBackImagesView() {
        view.addSubview(bgImage)
        bgImage.image = AccountUI.Asset.rectangle.image
        bgImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(321)
        }

        view.addSubview(vacuumImg)
        vacuumImg.image = AccountUI.Asset.base.image
        vacuumImg.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(69)
            make.height.equalTo(252)
        }

        view.addSubview(brandImg)
        brandImg.image = AccountUI.Asset.vacuum.image
        brandImg.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(76)
            make.top.equalToSuperview().offset(343)
            make.width.equalTo(223)
            make.height.equalTo(40)
        }
    }

    /// 添加阅读协议和政策
    func addPrivacyView() {
        view.addSubview(selectBtn)
        selectBtn.setBackgroundImage(AccountUI.Asset.unselectIcon.image, for: .normal)
        selectBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(464)
            make.height.width.equalTo(18)
        }
        selectBtn.addTarget(self, action: #selector(clickAgreementsBtn(sender:)), for: .touchUpInside)

        view.addSubview(privacyLabel)
        privacyLabel.isUserInteractionEnabled = true
        privacyLabel.font = UIFont.systemFont(ofSize: 16)
        let noticeStr = L10n.Account.AProtocol.notice
        let attibute = NSMutableAttributedString(string: noticeStr)
        let color = privacyTitleColor
        let range = NSRange(location: 0, length: noticeStr.count)
        let font = UIFont.systemFont(ofSize: 14)
        attibute.addAttributes([NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color],
                               range: range)
        let protocalStr = L10n.Account.Legal.Terms.User.agreement
        let policyStr = L10n.Account.Privacy.policy
        range1 = (noticeStr as NSString).range(of: protocalStr)
        attibute.addAttributes([NSAttributedString.Key.foregroundColor: attibuteColor], range: range1)
        range2 = (noticeStr as NSString).range(of: policyStr)
        attibute.addAttributes([NSAttributedString.Key.foregroundColor: attibuteColor], range: range2)
        privacyLabel.attributedText = attibute
        privacyLabel.snp.makeConstraints { make in
            make.left.equalTo(selectBtn.snp.right)
            make.top.equalTo(selectBtn.snp.top).offset(-5)
            make.height.equalTo(26)
            make.right.equalToSuperview().offset(-20)
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel(gesture:)))
        privacyLabel.addGestureRecognizer(tap)
    }

    /// 添加登录按钮和下一步按钮
    func addLoginAndRegisterView() {
        view.addSubview(loginBtn)
        loginBtn.backgroundColor = loginBtnBgColor
        loginBtn.layer.cornerRadius = 16
        loginBtn.setTitle(L10n.Account.login, for: .normal)
        loginBtn.setTitleColor(loginBtnTitleColor, for: .normal)
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(privacyLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(56)
        }
        loginBtn.addTarget(self, action: #selector(clickLoginBtn(sender:)), for: .touchUpInside)

        view.addSubview(registBtn)
        registBtn.setTitle(L10n.Account.User.register, for: .normal)
        registBtn.titleLabel?.textAlignment = .center
        registBtn.setTitleColor(loginBtnBgColor, for: .normal)
        registBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        registBtn.snp.makeConstraints { make in
            make.centerX.equalTo(loginBtn)
            make.top.equalTo(loginBtn.snp.bottom).offset(38)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        registBtn.addTarget(self, action: #selector(clicRegistBtn(sender:)), for: .touchUpInside)
    }

    /// 点击了同意按钮
    @objc func clickAgreementsBtn(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        isAgree = sender.isSelected
        if sender.isSelected {
            sender.setBackgroundImage(AccountUI.Asset.selectIcon.image, for: .normal)
        } else {
            sender.setBackgroundImage(AccountUI.Asset.unselectIcon.image, for: .normal)
        }
    }

    /// 点击了登录按钮
    @objc func clickLoginBtn(sender: UIButton) {
        // 没有勾选同意按钮,弹框提示
        if isAgree == false {
            ToastView.toast(content: L10n.Account.AProtocol.Dialog.notice)
        } else {
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }

    /// 点击新用户注册按钮
    @objc func clicRegistBtn(sender: UIButton) {
        if isAgree == false {
            ToastView.toast(content: L10n.Account.AProtocol.Dialog.notice)
        } else {
            navigationController?.pushViewController(RegisterViewController(), animated: true)
            print("click to enter register viewcontroller")
        }
    }

    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttibutedTextInLabel(label: privacyLabel, inRange: range1) {
            print("clicl user agreement s")
        } else if gesture.didTapAttibutedTextInLabel(label: privacyLabel, inRange: range2) {
            print("click privacy policy")
        } else {
            print("click label but no response")
        }
    }
}
