import Common
import SnapKit
import UIKit

class PersonHeaderView: UIView {
    var bgImg: UIImageView!
    var avatarImg: UIImageView!
    var nameLabel: UILabel!
    var accountLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = contentBackgroundColor
        setupSubViews()
    }

    func setupSubViews() {
        bgImg = UIImageView(frame: CGRect.zero)
        addSubview(bgImg)
        bgImg.image = AccountUI.Asset.rectangle.image
        bgImg.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }

        avatarImg = UIImageView(frame: CGRect.zero)
        addSubview(avatarImg)
        avatarImg.layer.cornerRadius = 72.0 / 2
        avatarImg.layer.masksToBounds = true
        avatarImg.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.top.equalToSuperview().offset(73)
            make.width.height.equalTo(72)
        }

        nameLabel = UILabel()
        addSubview(nameLabel)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textColor = mainTitleColor
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarImg.snp.right).offset(12)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(avatarImg.snp.top).offset(13)
            make.height.equalTo(22)
        }

        accountLabel = UILabel()
        addSubview(accountLabel)
        accountLabel.font = UIFont.systemFont(ofSize: 14)
        accountLabel.textColor = mainTitleColor
        accountLabel.snp.makeConstraints { make in
            make.left.height.width.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
        }
    }

    public func updateHeaderView(avatar: UIImage, name: String, account: String) {
        avatarImg.image = avatar
        nameLabel.text = name
        accountLabel.text = account
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
