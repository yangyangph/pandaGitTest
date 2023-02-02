import UIKit

/// 选择时间HH:mm 通用弹框
open class CommonsSelectTimeAlertView: AlertView {
    public typealias CancelHandler = () -> Void
    public typealias SureHandler = (_ time: String) -> Void
    public var selectTime: String = "00:00"
    let bgView = UIView()
    lazy var titleLabel: UILabel = {
        let titleLab = UILabel()
        titleLabel.textColor = mainTitleColor
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        return titleLab
    }()

    lazy var subTitleLabel: UILabel = {
        let sublTitleLab = UILabel()
        subTitleLabel.textColor = subTitleColor
        subTitleLabel.font = UIFont.systemFont(ofSize: 14)
        subTitleLabel.textAlignment = .left
        subTitleLabel.numberOfLines = 0
        return sublTitleLab
    }()

    public init(title: String, subTitle: String?, currentTime: String,
                cancelHandler: @escaping CancelHandler, sureHandler: @escaping SureHandler) {
        super.init(frame: CGRect.zero)
        selectTime = currentTime
        setupBgView()
        setupTitleLab(title: title, subTitle: subTitle!)

        let bottomView = SureAndCancelButton.init { [weak self] in
            cancelHandler()
            self?.hide()
        } sureHandler: { [weak self] _ in
            sureHandler(self?.selectTime ?? "00:00")
            self?.hide()
        }

        bgView.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.height.equalTo(26)
            make.bottom.equalToSuperview().offset(-24)
        }

        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        bgView.addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview().offset(-68)
            make.width.equalToSuperview().offset(-24)
        }
        let hour = currentTime.prefix("00".count)
        pickerView.selectRow((Int(hour) ?? 0), inComponent: 0, animated: false)
        let minute = currentTime.suffix("00".count)
        pickerView.selectRow((Int(minute) ?? 0), inComponent: 1, animated: false)
    }

    func setupBgView() {
        bgView.backgroundColor = contentBackgroundColor
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 24
        self.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(-16)
            make.height.equalTo(304)
        }
    }

    func setupTitleLab(title: String, subTitle: String) {
        titleLabel.text = title
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.right.left.equalTo(0)
            make.top.equalTo(bgView.snp.top).offset(20)
        }

        subTitleLabel.text = subTitle
        bgView.addSubview(subTitleLabel)
        subTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommonsSelectTimeAlertView: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 24
        }
        return 60
    }

    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 42
    }

    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int,
                           forComponent component: Int, reusing view: UIView?) -> UIView {
        // 修改选中行的背景色
        let pickerSubviews = pickerView.subviews
        for speartorView: UIView in pickerSubviews where speartorView.frame.height<1 {
            speartorView.backgroundColor = .clear
        }
        for subView in pickerView.subviews where subView.subviews.count != 0 {
//            if subView.subviews.count != 0 {
                let contentViews = subView.subviews[0]
                for rowView in contentViews.subviews where rowView.center.y == contentViews.center.y {
//                    if rowView.center.y == contentViews.center.y {
                        rowView.backgroundColor = selectCellColor
                        rowView.layer.cornerRadius = 18
                        rowView.clipsToBounds = true
                        if pickerView.subviews.count > 1 {
                            pickerView.subviews[1].backgroundColor = .clear
                        }
                        break
//                    }
                }
                break
//            }
        }
        let pickerLabel = UILabel()
        pickerLabel.textAlignment = .center
        let attributedStr = NSMutableAttributedString()
        let time = NSAttributedString(string: String(format: "%02d", row),
                                      attributes: [NSAttributedString.Key.foregroundColor: mainTitleColor,
                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)])
        attributedStr.append(time)
        pickerLabel.attributedText = attributedStr
        return pickerLabel
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            guard let rang = Range(NSRange(location: 0, length: 2), in: selectTime) else { return }
            selectTime = selectTime.replacingCharacters(in: rang, with: String(format: "%02d", row))
        }
        if component == 1 {
            guard let rang = Range(NSRange(location: "00:".count, length: 2), in: selectTime) else { return }
            selectTime = selectTime.replacingCharacters(in: rang, with: String(format: "%02d", row))
        }
    }
}
