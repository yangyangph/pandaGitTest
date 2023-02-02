import Common
import SnapKit
import UIKit

public class PersonalSettingViewController: BaseViewController {
    var headerView: PersonHeaderView!
    var tableView: UITableView!
    var bottomView: PersonBottomView!
    var logoutAlert: FullAlertView!
    var dataArrar = [[String]]()
    var subArrar = [String]()
    let cellID = "CellIdentifyID"
    let cellSubTitleID = "CellSubtitleIdentifyID"

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = contentBackgroundColor
        setDataArray()
        setupTableView()
        addAlertView()
    }

 

    func setDataArray() {
        let myInfo = L10n.Account.My.info
        let safety = L10n.Account.Login.safety
        let setting = Common.L10n.Common.Notification.setting
        let version = Common.L10n.Common.App.version
        let directions = Common.L10n.Common.User.directions
        let aboutUs = Common.L10n.Common.About.us
        let service = Common.L10n.Common.Customer.service
        let birthday = L10n.Account.Nickname.birthday
        let password = L10n.Account.Info.Change.password
        let verValue = Common.L10n.Common.Current.Version.value(0.1)
        dataArrar = [[myInfo, safety], [setting, version], [directions, aboutUs, service]]
        subArrar = [birthday, password, verValue]
    }

    func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.backgroundColor = viewBackgroundColor
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-UIDevice.rv_safeDistanceTop())
            make.left.right.bottom.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = UIView(frame: CGRect.zero)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(MainTitleTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(SubTitleViewCell.self, forCellReuseIdentifier: cellSubTitleID)
    }

    func addAlertView() {
        logoutAlert = FullAlertView(frame: .zero)
        view.addSubview(logoutAlert)
        logoutAlert.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        setAlertViewHideStatus(status: true)
    }

    func clickExitBtnToSignOut() {
        setAlertViewHideStatus(status: false)
        logoutAlert.buttonTapBlock = { [self] type in
            setAlertViewHideStatus(status: true)
            if type == .confirm {
               
            }
        }
    }

    func setAlertViewHideStatus(status: Bool) {
        logoutAlert.isHidden = status
    }


    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension PersonalSettingViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: UITableViewDelagate

    public func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || (indexPath.section == 1 && indexPath.row == 1) {
            return 73.0
        }
        return 54
    }

    /// section number
    public func numberOfSections(in _: UITableView) -> Int {
        return 3
    }

    /// cell的个数
    public func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 2
        }
        return 3
    }

    /// cell设置
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 || (indexPath.section == 1 && indexPath.row == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellSubTitleID, for: indexPath)
                as? SubTitleViewCell
            cell?.setHeadAndTailRoundCorners(tableView: tableView, indexPath: indexPath,
                                             radius: 16, isExistHeaderView: false, isExistFooterView: false)
            cell?.mainTitle.text = dataArrar[indexPath.section][indexPath.row]
            if indexPath.section == 0 {
                cell?.subTitle?.text = subArrar[indexPath.row]
            } else {
                cell?.subTitle?.text = subArrar.last
            }
            return cell!

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? MainTitleTableViewCell
            cell?.setHeadAndTailRoundCorners(tableView: tableView, indexPath: indexPath)
            cell?.mainTitle.text = dataArrar[indexPath.section][indexPath.row]
            return cell!
        }
    }

    /// 点击选择的cell
    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt is :\(indexPath.row)")
        if indexPath.section == 0 && indexPath.row == 1 {
            navigationController?.pushViewController(AccountSecurityViewController(), animated: true)
        }
    }

    /// 修改 tableView 距导航栏顶部距离和section间距
    public func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 160
        }
        return 24
    }

    public func tableView(_: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 100
        }
        return 0.0
    }

    public func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            headerView = PersonHeaderView(frame: CGRect(x: 0, y: 0, width: UIDevice.rv_screenWidth(), height: 160))

            headerView.updateHeaderView(avatar: AccountUI.Asset.rectangle.image, name: "用户名",
                                        account: "123243535")
            return headerView
        }
        return UIView(frame: .zero)
    }

    public func tableView(_: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 2 {
            bottomView = PersonBottomView(frame: CGRect(x: 0, y: 0, width: UIDevice.rv_screenWidth(), height: 100))
            bottomView.exitBtnTapBlock = { [self] in
                clickExitBtnToSignOut()
            }
            return bottomView
        }
        return UIView(frame: .zero)
    }
}
