import Common
import SnapKit
import UIKit

class SubTitleViewCell: MainTitleTableViewCell {
    var subTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainTitle.snp.remakeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(22)
        }

        subTitle = UILabel(frame: CGRect.zero)
        contentView.addSubview(subTitle)
        subTitle.textColor = privacyTitleColor
        subTitle.font = UIFont(name: "PingFang SC", size: 14)
        subTitle.snp.makeConstraints { make in
            make.left.right.equalTo(mainTitle)
            make.top.equalTo(mainTitle.snp.bottom).offset(3)
            make.height.equalTo(19)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
