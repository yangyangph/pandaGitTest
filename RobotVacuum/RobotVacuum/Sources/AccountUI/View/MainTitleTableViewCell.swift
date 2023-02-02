import Common
import UIKit

class MainTitleTableViewCell: BaseTableViewCell {
    var mainTitle: UILabel!
    var arrorView: UIImageView!
    var line: UILabel!
    var view1: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("init Basecell ---")
        backgroundColor = tableBgColor
        contentView.backgroundColor = contentBackgroundColor
        mainTitle = UILabel(frame: CGRect.zero)
        mainTitle.textColor = cellTitleColor
        mainTitle.font = UIFont(name: "PingFang SC", size: 16)
        contentView.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-50)
            make.centerY.equalToSuperview()
            make.height.equalTo(22)
        }

        arrorView = UIImageView(frame: CGRect.zero)
        contentView.addSubview(arrorView)
        arrorView.image = AccountUI.Asset.accessoryIco.image
        arrorView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(16)
            make.centerY.equalToSuperview()
        }
        line = UILabel(frame: CGRect.zero)
        contentView.addSubview(line)
        line.backgroundColor = cellSingleLineColor
        line.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }

    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.origin.x += 12
            newFrame.size.width -= newFrame.origin.x * 2
            super.frame = newFrame
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
