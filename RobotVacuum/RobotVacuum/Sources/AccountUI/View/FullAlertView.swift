import Common
import SnapKit
import UIKit

enum ButtonTapType {
    case cancel // 取消按钮
    case confirm // 确定按钮
}

class FullAlertView: UIView {
    var alertView: UIView!
    var mainTitle: UILabel!
    var leftBtn: UIButton!
    var rightBtn: UIButton!
    var horizionLine: UILabel!
    var verLine: UILabel!
    var buttonType: ButtonTapType = .cancel
    var buttonTapBlock: ((_ btnType: ButtonTapType) -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = privacyViewBgColor
        setupSubViews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubViews() {
        addTopSubviews()
        addBottomSubviews()
    }

    func addTopSubviews() {
        alertView = UILabel(frame: .zero)
        addSubview(alertView)
        alertView.backgroundColor = contentBackgroundColor
        alertView.layer.cornerRadius = 16
        alertView.layer.masksToBounds = true
        alertView.isUserInteractionEnabled = true
        alertView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(114)
        }

        mainTitle = UILabel(frame: .zero)
        alertView.addSubview(mainTitle)
        mainTitle.textColor = mainTitleColor
        mainTitle.text = L10n.Account.signOutConfirm
        mainTitle.font = UIFont(name: "PingFang SC", size: 16)
        mainTitle.textAlignment = .center
        mainTitle.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(56)
        }

        horizionLine = UILabel(frame: .zero)
        alertView.addSubview(horizionLine)
        horizionLine.backgroundColor = cellSingleLineColor
        horizionLine.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }

    func addBottomSubviews() {
        leftBtn = UIButton(type: .custom)
        alertView.addSubview(leftBtn)
        leftBtn.setTitleColor(mainTitleColor, for: .normal)
        leftBtn.setTitle(Common.L10n.Common.cancel, for: .normal)
        leftBtn.titleLabel?.font = UIFont(name: "PingFang SC", size: 14)
        leftBtn.titleLabel?.textAlignment = .center
        leftBtn.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
            make.width.height.equalToSuperview().dividedBy(2)
        }
        leftBtn.addTarget(self, action: #selector(clickCancelBtn(_:)), for: .touchUpInside)

        rightBtn = UIButton(type: .custom)
        alertView.addSubview(rightBtn)
        rightBtn.setTitleColor(mainTitleColor, for: .normal)
        rightBtn.setTitle(Common.L10n.Common.sure, for: .normal)
        rightBtn.titleLabel?.font = UIFont(name: "PingFang SC", size: 14)
        rightBtn.titleLabel?.textAlignment = .center
        rightBtn.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview()
            make.width.height.equalTo(leftBtn)
        }
        rightBtn.addTarget(self, action: #selector(clickConfirmBtn(_:)), for: .touchUpInside)

        verLine = UILabel(frame: .zero)
        alertView.addSubview(verLine)
        verLine.backgroundColor = cellSingleLineColor
        verLine.snp.makeConstraints { make in
            make.top.bottom.equalTo(leftBtn)
            make.centerX.equalToSuperview()
            make.width.equalTo(0.5)
        }
    }

    @objc func clickCancelBtn(_: UIButton) {
        buttonTapBlock?(.cancel)
    }

    @objc func clickConfirmBtn(_: UIButton) {
        buttonTapBlock?(.confirm)
    }
}
