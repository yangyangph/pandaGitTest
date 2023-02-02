import Common
import UIKit
import WebKit

class PrivacyPolicyView: UIView {
    var declarationView = UIView()
    var titleLabel = UILabel()
    var contentWeb = WKWebView()
    var checkBtn = UIButton()
    var agreeLabel = UILabel()
    var cancelBtn = UIButton()
    var vercLine = UILabel()
    var confirmBtn = UIButton()
    // 是否勾选同意按钮
    var isAgree = false
    var range1: NSRange!
    var range2: NSRange!
    var buttonTapBlock: ((_ btnType: ButtonTapType) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = privacyViewBgColor
        setupSubviews()
    }

    func setupSubviews() {
        addContentView()
        addPrivacyPolicyView()
        addBottomView()
    }

    func addContentView() {
        addSubview(declarationView)
        declarationView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(180)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-180)
        }
        declarationView.layer.cornerRadius = 16
        declarationView.backgroundColor = declarationViewBgColor

        declarationView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(24)
            make.height.equalTo(22)
        }
        titleLabel.text = L10n.Account.Privacy.instructions
        titleLabel.textAlignment = .center
        titleLabel.textColor = mainTitleColor
        titleLabel.font = UIFont.systemFont(ofSize: 14)

        declarationView.addSubview(contentWeb)
        contentWeb.backgroundColor = declarationViewBgColor
        contentWeb.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(61)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-92)
        }
        contentWeb.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let myUrl = URL(string: "https://www.baidu.com")!
        let request = URLRequest(url: myUrl)
        contentWeb.load(request)
    }

    func addPrivacyPolicyView() {
        declarationView.addSubview(checkBtn)
        checkBtn.setBackgroundImage(AccountUI.Asset.unselectIcon.image, for: .normal)
        checkBtn.snp.makeConstraints { make in
            make.top.equalTo(contentWeb.snp.bottom).offset(13)
            make.left.equalToSuperview().offset(16)
            make.width.height.equalTo(18)
        }
        checkBtn.addTarget(self, action: #selector(clickCheckBtn(sender:)), for: .touchUpInside)

        declarationView.addSubview(agreeLabel)
        agreeLabel.isUserInteractionEnabled = true
        agreeLabel.font = UIFont.systemFont(ofSize: 14)
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
        // 用户协议颜色
        attibute.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], range: range1)
        range2 = (noticeStr as NSString).range(of: policyStr)
        // 隐私协议颜色
        attibute.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], range: range2)
        agreeLabel.attributedText = attibute
        agreeLabel.snp.makeConstraints { make in
            make.left.equalTo(checkBtn.snp.right)
            make.top.bottom.equalTo(checkBtn)
            make.right.equalToSuperview()
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel(gesture:)))
        agreeLabel.addGestureRecognizer(tap)
    }

    func addBottomView() {
        declarationView.addSubview(cancelBtn)
        cancelBtn.setTitle(L10n.Account.Privacy.refuse, for: .normal)
        cancelBtn.titleLabel?.textAlignment = .center
        cancelBtn.setTitleColor(tabbarTintColor, for: .normal)
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        cancelBtn.snp.makeConstraints { make in
            make.top.equalTo(agreeLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
            make.centerX.equalToSuperview().dividedBy(2)
            make.height.equalTo(20)
        }
        cancelBtn.addTarget(self, action: #selector(clicCancelBtn(sender:)), for: .touchUpInside)

        declarationView.addSubview(vercLine)
        vercLine.backgroundColor = vercLineBgColor
        vercLine.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalTo(cancelBtn)
            make.width.equalTo(1)
        }

        declarationView.addSubview(confirmBtn)
        confirmBtn.setTitle(L10n.Account.Privacy.agree, for: .normal)
        confirmBtn.titleLabel?.textAlignment = .center
        confirmBtn.setTitleColor(tabbarTintColor, for: .normal)
        confirmBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        confirmBtn.snp.makeConstraints { make in
            make.top.bottom.width.equalTo(cancelBtn)
            make.centerX.equalToSuperview().multipliedBy(1.5)
        }
        confirmBtn.addTarget(self, action: #selector(clicConfirmBtn(sender:)), for: .touchUpInside)
    }

    @objc func clickCheckBtn(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        isAgree = sender.isSelected
        if sender.isSelected {
            sender.setBackgroundImage(AccountUI.Asset.selectIcon.image, for: .normal)
        } else {
            sender.setBackgroundImage(AccountUI.Asset.unselectIcon.image, for: .normal)
        }
        print("click Agreements Btn, sender is \(sender.isSelected)")
    }

    @objc func tapLabel(gesture: UITapGestureRecognizer) {
        if gesture.didTapAttibutedTextInLabel(label: agreeLabel, inRange: range1) {
            print("pricacy webview clicl user agreement ")
        } else if gesture.didTapAttibutedTextInLabel(label: agreeLabel, inRange: range2) {
            print("pricacy webview click privacy policy")
        } else {
            print("pricacy webview click label but no response")
        }
    }

    @objc func clicCancelBtn(sender: UIButton) {
        print("click cancel button:\(sender)")
        buttonTapBlock?(.cancel)
    }

    @objc func clicConfirmBtn(sender: UIButton) {
        print("click confirm button:\(sender)")
        if isAgree == true {
            buttonTapBlock?(.confirm)
        } else {
            ToastView.toast(content: L10n.Account.AProtocol.Dialog.notice)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
