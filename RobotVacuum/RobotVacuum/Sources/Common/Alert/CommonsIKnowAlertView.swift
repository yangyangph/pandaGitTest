import UIKit

/// 我知道了 通用弹框
open class CommonsIKnowAlertView: AlertView {
    public typealias ConfirmHandler = () -> Void
    private var isTapMaskDismiss: Bool = false
    private var confirmHandler: ConfirmHandler?
    let bgView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 32, height: 146))
    lazy var confirmButton: UIButton = {
        let confirmButton = UIButton(type: UIButton.ButtonType.custom)
        confirmButton.setTitleColor(clickButtonColor, for: UIControl.State.normal)
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        confirmButton.addTarget(self, action: #selector(self.confirmClick), for: UIControl.Event.touchUpInside)
        return confirmButton
    }()

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

    public init(title: String, subTitle: String?,
                confirmText: String, isTapMaskDismiss: Bool = false, confirmHandler: ConfirmHandler?) {

        super.init(frame: CGRect.zero)
        self.isTapMaskDismiss = isTapMaskDismiss
        self.confirmHandler = confirmHandler
        setupBgView()
        setupTitleLab(title: title, subTitle: subTitle!)

        confirmButton.setTitle(confirmText, for: .normal)
        bgView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
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

    func setupBgView() {
        self.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(146)
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

    @objc func confirmClick() {
        DispatchQueue.main.async { [weak self] in
            self?.hide()
            self?.confirmHandler?()
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
