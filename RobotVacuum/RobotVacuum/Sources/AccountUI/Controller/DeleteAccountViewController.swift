import Common
import SnapKit
import UIKit

class DeleteAccountViewController: BaseViewController {
    var contentView: UIView!
    var riskImg: UIImageView!
    var riskLabel: UILabel!
    var topTipLabel: UILabel!
    var topSubLabel: UILabel!
    var bottomTipLabel: UILabel!
    var bottomSubLabel: UILabel!
    var bottomBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.Account.delete
        view.backgroundColor = contentBackgroundColor
        setupSubViews()
    }

    func setupSubViews() {
        addContentAndRiskViews()
        addTipsViews()
        addBottomBtn()
    }

    func addContentAndRiskViews() {
        contentView = UIView()
        view.addSubview(contentView)
        contentView.backgroundColor = viewBackgroundColor
        contentView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(UIDevice.rv_navigationFullHeight())
        }

        riskImg = UIImageView(frame: .zero)
        contentView.addSubview(riskImg)
        riskImg.image = AccountUI.Asset.logoutCircle.image
        riskImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            make.width.height.equalTo(150)
        }

        riskLabel = UILabel(frame: .zero)
        contentView.addSubview(riskLabel)
        riskLabel.font = UIFont.boldSystemFont(ofSize: 20)
        riskLabel.textColor = attibuteColor
        riskLabel.textAlignment = .center
        riskLabel.text = L10n.Account.Delete.dangerous
        riskLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(riskImg.snp.bottom).offset(14)
            make.width.equalTo(160)
            make.height.equalTo(28)
        }
    }

    func addTipsViews() {
        topTipLabel = UILabel(frame: .zero)
        contentView.addSubview(topTipLabel)
        topTipLabel.font = UIFont.boldSystemFont(ofSize: 16)
        topTipLabel.textColor = mainTitleColor
        topTipLabel.textAlignment = .left
        topTipLabel.text = L10n.Account.Delete.Login.fail
        topTipLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(riskLabel.snp.bottom).offset(26)
            make.height.equalTo(22)
        }

        topSubLabel = UILabel(frame: .zero)
        contentView.addSubview(topSubLabel)
        topSubLabel.font = UIFont.systemFont(ofSize: 14)
        topSubLabel.textColor = subTitleColor
        topSubLabel.textAlignment = .left
        topSubLabel.numberOfLines = 0
        topSubLabel.text = L10n.Account.Delete.Login.Fail.detail(L10n.Account.Product.name)
        topSubLabel.snp.makeConstraints { make in
            make.left.right.equalTo(topTipLabel)
            make.top.equalTo(topTipLabel.snp.bottom)
            make.height.equalTo(40)
        }

        bottomTipLabel = UILabel(frame: .zero)
        contentView.addSubview(bottomTipLabel)
        bottomTipLabel.font = UIFont.boldSystemFont(ofSize: 16)
        bottomTipLabel.textColor = mainTitleColor
        bottomTipLabel.textAlignment = .left
        bottomTipLabel.text = L10n.Account.Message.delete
        bottomTipLabel.snp.makeConstraints { make in
            make.left.right.height.equalTo(topTipLabel)
            make.top.equalTo(topSubLabel.snp.bottom).offset(22)
        }

        bottomSubLabel = UILabel(frame: .zero)
        contentView.addSubview(bottomSubLabel)
        bottomSubLabel.font = UIFont.systemFont(ofSize: 14)
        bottomSubLabel.textColor = subTitleColor
        bottomSubLabel.textAlignment = .left
        bottomSubLabel.numberOfLines = 0
        bottomSubLabel.text = L10n.Account.Message.Detail.delete(L10n.Account.Product.name)
        bottomSubLabel.snp.makeConstraints { make in
            make.left.right.height.equalTo(topSubLabel)
            make.top.equalTo(bottomTipLabel.snp.bottom)
        }
    }

    func addBottomBtn() {
        bottomBtn = UIButton(type: .custom)
        contentView.addSubview(bottomBtn)
        bottomBtn.setTitle(L10n.Account.goAhead, for: .normal)
        bottomBtn.setTitleColor(errorBorderColor, for: .normal)
        bottomBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        bottomBtn.backgroundColor = contentBackgroundColor
        bottomBtn.layer.cornerRadius = 16
        bottomBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().offset(-UIDevice.rv_safeDistanceBottom() - 20)
        }
        bottomBtn.addTarget(self, action: #selector(clickBottomBtnAction(sender:)), for: .touchUpInside)
    }

    @objc func clickBottomBtnAction(sender _: UIButton) {
        navigationController?.pushViewController(ConfirmDeleteViewController(), animated: true)
    }
}
