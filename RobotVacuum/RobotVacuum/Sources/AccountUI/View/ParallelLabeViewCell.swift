import Common
import SnapKit
import UIKit

class ParallelLabeViewCell: MainTitleTableViewCell {
    var rightLabel: UILabel!

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
        print("init Basecell ---")

        mainTitle.snp.remakeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(22)
            make.right.equalTo(contentView.snp.centerX)
        }
        arrorView.isHidden = true

        rightLabel = UILabel(frame: CGRect.zero)
        rightLabel.textAlignment = .right
        rightLabel.textColor = privacyTitleColor
        rightLabel.font = UIFont(name: "OPlusSans", size: 3.0)
        contentView.addSubview(rightLabel)
        rightLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(22)
            make.left.equalTo(contentView.snp.centerX)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
