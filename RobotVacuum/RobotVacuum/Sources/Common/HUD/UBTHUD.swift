import UIKit

public enum UBTHUDType {
    case activity // 菊花样式
    case loading // 加载中...
    case badNetwork // 网络差
    case noNetwork // 无网络
    case noData
}

open class UBTHUD: NSObject {
    static let shared = UBTHUD()
    override private init() {}
    public static func show(hudType: UBTHUDType = .activity, tapClosure: (() -> Void)? = nil) {
        remove()
        DispatchQueue.main.async {
            let hudView = HUDView(hudType: hudType, tapClosure: tapClosure)
            keyWindow.addSubview(hudView)
        }
    }

    public static func remove() {
        DispatchQueue.main.async {
            for hudView in keyWindow.subviews where hudView is HUDView {
                hudView.removeFromSuperview()
            }
        }
    }
}

open class HUDView: UIView {
    private var tapClosure: (() -> Void)?
    public var iconBgImageView = UIImageView()
    public var iconImageView = UIImageView()
    public lazy var descLabel: UILabel = {
        var lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return lab
    }()

    @objc func maskViewTap() {}
    public init(hudType: UBTHUDType, tapClosure: (() -> Void)? = nil) {
        super.init(frame: UIScreen.main.bounds)
        self.tapClosure = tapClosure

        let maskView = UIView()
        maskView.backgroundColor = loadingMaskViewColor
        addSubview(maskView)
        maskView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        maskView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(maskViewTap)))

        let stackView = initStackView(iconImageView: iconImageView, descLabel: descLabel)
        layoutStackView(hudType: hudType, stackView: stackView)

        switch hudType {
        case .activity:
            setupActivityIndicatorView()
        case .loading:
            iconImageView.image = UIImage.name("icon_loading")
            iconImageView.rotate()
            descLabel.textColor = subTitleColor
            descLabel.text = L10n.Common.loading
        case .badNetwork:
            iconImageView.image = UIImage.name("icon_bad_network")
            descLabel.textColor = subTitleColor
            descLabel.text = L10n.Common.Weak.Network.check
        case .noNetwork:
            iconImageView.image = UIImage.name("icon_no_network")
            descLabel.textColor = unEnableTitleColor
            descLabel.text = L10n.Common.No.Network.check
            isUserInteractionEnabled = false
            maskView.isUserInteractionEnabled = false
        case .noData:
            iconBgImageView.image = UIImage.name("")
            iconImageView.image = UIImage.name("message_null")
            descLabel.textColor = unEnableTitleColor
            descLabel.numberOfLines = 0
            descLabel.textAlignment = .center
            addSubview(iconBgImageView)
            addSubview(iconImageView)
            addSubview(descLabel)
            iconBgImageView.snp.makeConstraints { make in
                make.centerX.equalTo(self)
                //                make.bottom.equalTo(stackView.snp_bottomMargin).offset(-50)
                make.top.equalTo(self).offset(124)
                make.size.equalTo(CGSize(width: 100, height: 100))
            }
            descLabel.snp.makeConstraints { make in
                make.top.equalTo(iconBgImageView.snp.bottom).offset(30)
                make.centerX.equalTo(self)
            }
            iconImageView.snp.makeConstraints { make in
                make.left.equalTo(iconBgImageView.snp.centerX)
                make.size.equalTo(CGSize(width: 56, height: 56))
                make.bottom.equalTo(iconBgImageView.snp.bottom).offset(5)
            }
            isUserInteractionEnabled = false
            maskView.isUserInteractionEnabled = false
        }
    }

    func setupActivityIndicatorView() {
        let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        if #available(iOS 13.0, *) {
            activityIndicatorView.style = .medium
        } else {
            activityIndicatorView.style = .gray
        }
        activityIndicatorView.color = activityIndicatorColor
        activityIndicatorView.startAnimating()
        addSubview(activityIndicatorView)
        activityIndicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func initStackView(iconImageView: UIImageView, descLabel: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, descLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }

    func layoutStackView(hudType: UBTHUDType, stackView: UIStackView) {
        switch hudType {
        case .loading:
            addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        case .badNetwork:
            addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            stackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClosureSelector)))
        case .noNetwork:
            addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(-UIDevice.rv_navigationFullHeight())
            }
        case .noData:
            return
        case .activity:
            return
        }
    }

    public func logoAnimationLoop() {
        iconImageView.layer.removeAnimation(forKey: "Move")
        let loopHW = 30.0
        let boundingRect = CGRect(x: UIScreen.main.bounds.width / 2.0, y: 173,
                                  width: loopHW, height: loopHW)
        let orbit = CAKeyframeAnimation(keyPath: "position")
        orbit.duration = 3
        orbit.repeatCount = 10
        orbit.path = CGPath(ellipseIn: boundingRect, transform: nil)
        orbit.calculationMode = CAAnimationCalculationMode.paced
        iconImageView.layer.add(orbit, forKey: "Move")
    }

    @objc private func tapClosureSelector() {
        tapClosure?()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
