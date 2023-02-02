import UIKit
import SnapKit

public let currentAlertViewTag = 987
public let userExperiencePlanAlertViewTag = 988

open class AlertView: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.frame = keyWindow.bounds
        self.tag = currentAlertViewTag

        let maskView = UIView.init()
        maskView.backgroundColor = maskViewColor
        self.addSubview(maskView)
        maskView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        maskView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(maskViewTap)))
    }

    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func show() {
        hide()
        keyWindow.addSubview(self)
    }

    open func hide() {
        for index in 0..<keyWindow.subviews.count {
            let windowSubview = keyWindow.subviews[index]
            if windowSubview.tag == currentAlertViewTag {
                windowSubview.removeFromSuperview()
                break
            }
        }
    }

    /// 点击蒙层事件，子类可以根据业务需求进行重写
    @objc open func maskViewTap() {
        hide()
    }
}

open class SureAndCancelButton: UIView {
    public typealias CancelHandler = () -> Void
    public typealias SureHandler = (_ statusCode: String) -> Void
    public var cancelHandler: CancelHandler?
    public var sureHandler: SureHandler?
    public let sureButton = UIButton(type: UIButton.ButtonType.custom)
    public let cancelButton = UIButton(type: UIButton.ButtonType.system)

    public convenience init(sureTitle: String? = "", cancelTitle: String = "",
                            cancelHandler: @escaping CancelHandler, sureHandler: @escaping SureHandler) {
        self.init(frame: CGRect.zero, sureTitle: sureTitle?.count ?? 0 > 0 ? sureTitle! : L10n.Common.sure,
                  cancelTitle: cancelTitle.count > 0 ? cancelTitle :L10n.Common.cancel)
        self.cancelHandler = cancelHandler
        self.sureHandler = sureHandler
    }

    public init(frame: CGRect, sureTitle: String, cancelTitle: String = "") {
        super.init(frame: frame)
        cancelButton.setTitle(cancelTitle.count > 0 ? cancelTitle : L10n.Common.cancel, for: UIControl.State.normal)
        cancelButton.setTitleColor(clickButtonColor, for: UIControl.State.normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelButton.addTarget(self, action: #selector(self.cancelClick), for: UIControl.Event.touchUpInside)
        self.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.left.top.equalTo(0)
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }

        setSureButton(title: sureTitle)
        sureButton.setTitleColor(clickButtonColor, for: UIControl.State.normal)
        sureButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        sureButton.addTarget(self, action: #selector(self.sureClick), for: UIControl.Event.touchUpInside)
        self.addSubview(sureButton)
        sureButton.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(cancelButton.snp.right)
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }

        let line = UIView()
        line.backgroundColor = lineViewColor
        self.addSubview(line)
        line.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(20)
        }
    }

    public func setSureButton(title: String) {
        sureButton.setTitle(title, for: UIControl.State.normal)
    }

    @objc func cancelClick() {
        DispatchQueue.main.async { [weak self] in
            if self?.cancelHandler != nil {
                self?.cancelHandler!()
            }
        }
    }

    @objc func sureClick() {
        DispatchQueue.main.async { [weak self] in
            if self?.sureHandler != nil {
                self?.sureHandler!("")
            }
        }
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
