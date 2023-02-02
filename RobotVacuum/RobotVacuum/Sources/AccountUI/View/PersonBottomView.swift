import Common
import UIKit

class PersonBottomView: UIView {
    var exitBtn: UIButton!
    var exitBtnTapBlock: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupSubViews()
    }

    func setupSubViews() {
        exitBtn = UIButton(type: .custom)
        addSubview(exitBtn)
        exitBtn.setTitle(L10n.Account.signOut, for: .normal)
        exitBtn.setTitleColor(errorBorderColor, for: .normal)
        exitBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        exitBtn.backgroundColor = contentBackgroundColor
        exitBtn.layer.cornerRadius = 16
        exitBtn.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(56)
        }
        exitBtn.addTarget(self, action: #selector(clickExitBtnToSignOut(sender:)), for: .touchUpInside)
    }

    @objc func clickExitBtnToSignOut(sender _: UIButton) {
        exitBtnTapBlock?()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
