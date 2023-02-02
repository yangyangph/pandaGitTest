import Common
import SnapKit
import UIKit

class ToastView: UIView {
    public class func toast(content: String, completion: (() -> Void)? = nil) {
        let bgView = UIView()
        bgView.backgroundColor = toastBackgroundColor
        bgView.layer.cornerRadius = 12.0
        keyWindow.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().offset(-38)
            make.height.equalTo(53)
        }

        let tipLabel = UILabel()
        bgView.addSubview(tipLabel)
        tipLabel.textColor = toastTitleColor
        tipLabel.font = UIFont.systemFont(ofSize: 14)
        tipLabel.textAlignment = .center
        tipLabel.text = content
        tipLabel.snp.makeConstraints { make in
            make.edges.equalTo(bgView).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            bgView.removeFromSuperview()
            keyWindow.willRemoveSubview(bgView)
            completion?()
        }
    }
}
