import UIKit

public enum CommonsConfirmAlertViewPosition {
    case center
    case bottom
}

/// 取消/确认 通用弹框
open class CommonsConfirmAlertView: AlertView {

    public typealias LeftHandler = () -> Void
    public typealias RightHandler = () -> Void
    private var isTapMaskDismiss: Bool = false
    let bgView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 32,
                                                  height: 146))
    lazy var titleLabel: UILabel = {
        let titleLab = UILabel()
        titleLabel.lineSpace = 5
        titleLabel.textColor = mainTitleColor
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLab
    }()

    lazy var subTitleLabel: UILabel = {
       let subTitleLab = UILabel()
        subTitleLabel.lineSpace = 5
        subTitleLabel.textColor = mainTitleColor
        subTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subTitleLabel.textAlignment = .center
        subTitleLabel.numberOfLines = 0
        return subTitleLab
    }()

    public init(title: String, subTitle: String?, leftText: String,
                rightText: String, isTapMaskDismiss: Bool = false,
                alertPosition: CommonsConfirmAlertViewPosition = .center,
                leftHandler: @escaping LeftHandler, rightHandler: @escaping RightHandler) {
        super.init(frame: CGRect.zero)
        self.isTapMaskDismiss = isTapMaskDismiss

        setupBgView(alertPosition: alertPosition)

        setupTitleLab(title: title, subTitle: subTitle!)

        let bottomView = SureAndCancelButton.init(sureTitle: rightText, cancelTitle: leftText) { [weak self] in
            leftHandler()
            self?.hide()
        } sureHandler: { [weak self] _ in
            rightHandler()
            self?.hide()
        }

        bgView.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.height.equalTo(60)
            make.bottom.equalToSuperview()
        }

        let titleHeight = titleLabel.sizeThatFits(CGSize(width: UIDevice.rv_screenWidth() - 80,
                                                         height: CGFloat(MAXFLOAT))).height
        let subTitleHeight = subTitleLabel.sizeThatFits(CGSize(width: UIDevice.rv_screenWidth() - 80,
                                                               height: CGFloat(MAXFLOAT))).height
        bgView.snp.updateConstraints { make in
            make.height.equalTo(titleHeight + subTitleHeight + 24 + 15 + 60)
        }
    }
    func setupBgView(alertPosition: CommonsConfirmAlertViewPosition) {
        self.addSubview(bgView)
        switch alertPosition {
        case .center:
            bgView.snp.makeConstraints { make in
                make.left.equalTo(16)
                make.right.equalTo(-16)
                make.centerY.equalToSuperview()
                make.height.equalTo(146)
            }
        case .bottom:
            bgView.snp.makeConstraints { make in
                make.left.equalTo(16)
                make.right.equalTo(-16)
                make.bottom.equalTo(-16)
                make.height.equalTo(146)
            }
        }
        bgView.backgroundColor = contentBackgroundColor
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 18
        bgView.layer.masksToBounds = true
    }

    func setupTitleLab(title: String, subTitle: String) {
        titleLabel.text = title
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        subTitleLabel.text = subTitle
        bgView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func maskViewTap() {
        if isTapMaskDismiss == true {
            hide()
        }
    }

}
