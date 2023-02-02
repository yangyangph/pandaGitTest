import UIKit

open class BaseTableViewCell: UITableViewCell {
    override open func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print("setSelected is :\(selected)")
        selectionStyle = .none
        // Configure the view for the selected state
    }

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// 设置首尾单元格圆角
    /// - Parameters:
    ///   - indexPath: indexPath description
    ///   - radius: 角度
    ///   - isExistHeaderView: 是否存在分组头
    ///   - isExistFooterView: 是否存在分组尾
    public func setHeadAndTailRoundCorners(tableView: UITableView,
                                           indexPath: IndexPath,
                                           radius: CGFloat = kCellCornerRadius,
                                           isExistHeaderView: Bool = false,
                                           isExistFooterView: Bool = false) {
        let numberOfRow = tableView.numberOfRows(inSection: indexPath.section)
        if isExistHeaderView == false, isExistFooterView == false { // 不存在分组头 & 不存在分组尾
            /// 长度为1时 所有角为圆角，否则首单元格顶部圆角，尾部单元格底部圆角
            if numberOfRow == 1 {
                addCorner(conrners: .allCorners, radius: radius)
                contentView.addCorner(conrners: .allCorners, radius: radius)
            } else {
                if indexPath.row == 0 {
                    addCorner(conrners: [.topLeft, .topRight], radius: radius)
                    contentView.addCorner(conrners: [.topLeft, .topRight], radius: radius)
                } else if indexPath.row == numberOfRow - 1 {
                    addCorner(conrners: [.bottomLeft, .bottomRight], radius: radius)
                    contentView.addCorner(conrners: [.bottomLeft, .bottomRight], radius: radius)
                } else {
                    layer.mask = nil
                    contentView.layer.mask = nil
                }
            }
        } else if isExistHeaderView, isExistFooterView == false { // 存在分组头，不存在分组尾 只切最后一个cell底部圆角
            if indexPath.row == numberOfRow - 1 {
                addCorner(conrners: [.bottomLeft, .bottomRight], radius: radius)
                contentView.addCorner(conrners: [.bottomLeft, .bottomRight], radius: radius)
            } else {
                layer.mask = nil
                contentView.layer.mask = nil
            }
        } else if isExistHeaderView == false, isExistFooterView { // 不存在分组头，存在分组尾 只切第一个cell顶部圆角
            if indexPath.row == 0 {
                addCorner(conrners: [.topLeft, .topRight], radius: radius)
                contentView.addCorner(conrners: [.topLeft, .topRight], radius: radius)
            } else {
                layer.mask = nil
                contentView.layer.mask = nil
            }
        } else {
            layer.mask = nil
            contentView.layer.mask = nil
        }
    }

    /// 设置所有单元格圆角
    /// - Parameter radius: 角度
    public func setAllRoundCorners(radius: CGFloat = kCellCornerRadius) {
        addCorner(conrners: .allCorners, radius: radius)
        contentView.addCorner(conrners: .allCorners, radius: radius)
    }
}
