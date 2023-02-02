import Common
import SnapKit
import UIKit

class AccountSecurityViewController: BaseViewController {
    var tableView: UITableView!
    var deleteBtn: UIButton!
    let parallelCellID = "ParallelCellID"
    let mainCellID = "MainCellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = L10n.Account.Login.safety
        view.backgroundColor = contentBackgroundColor
        setupTableView()
        addDeletetBtn()
    }

    func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.backgroundColor = viewBackgroundColor
        tableView.tableHeaderView?.frame = CGRect.zero
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(UIDevice.rv_navigationFullHeight())
            make.left.right.bottom.equalTo(view)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ParallelLabeViewCell.self, forCellReuseIdentifier: parallelCellID)
        tableView.register(MainTitleTableViewCell.self, forCellReuseIdentifier: mainCellID)
    }

    func addDeletetBtn() {
        deleteBtn = UIButton(type: .custom)
        view.addSubview(deleteBtn)
        deleteBtn.setTitle(L10n.Account.delete, for: .normal)
        deleteBtn.setTitleColor(errorBorderColor, for: .normal)
        deleteBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        deleteBtn.backgroundColor = contentBackgroundColor
        deleteBtn.layer.cornerRadius = 16
        deleteBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(56)
            make.bottom.equalToSuperview().offset(-UIDevice.rv_safeDistanceBottom() - 20)
        }
        deleteBtn.addTarget(self, action: #selector(clickDeleteBtn(sender:)), for: .touchUpInside)
    }

    @objc func clickDeleteBtn(sender _: UIButton) {
        print("clickdeleteBtnAction ---")
        navigationController?.pushViewController(DeleteAccountViewController(), animated: true)
    }
}

extension AccountSecurityViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: UITableViewDelagate

    /// cell的高度
    func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 54.0
        }
        return 73
    }

    /// section number
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    /// cell的个数
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 2
    }

    /// cell设置
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: parallelCellID, for: indexPath)
                as? ParallelLabeViewCell
            cell?.setHeadAndTailRoundCorners(tableView: tableView, indexPath: indexPath,
                                             radius: 16, isExistHeaderView: false, isExistFooterView: false)
            cell?.mainTitle.text = L10n.Account.accountName
            cell?.rightLabel.text = "12587651234"
            return cell!

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: mainCellID, for: indexPath)
                as? MainTitleTableViewCell
            cell?.setHeadAndTailRoundCorners(tableView: tableView, indexPath: indexPath,
                                             radius: 16, isExistHeaderView: false, isExistFooterView: false)
            cell?.mainTitle.text = L10n.Account.Password.modify
            return cell!
        }
    }

    /// 点击选择的cell
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 1 {
            print("didSelectRowAt ----")
        }
    }

    /// 修改 tableView 距导航栏顶部距离和section间距
    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 20
        }
        return 0.0
    }

    func tableView(_: UITableView, heightForFooterInSection _: Int) -> CGFloat {
        return 0.0
    }

    func tableView(_: UITableView, viewForHeaderInSection _: Int) -> UIView? {
        return UIView(frame: .zero)
    }

    func tableView(_: UITableView, viewForFooterInSection _: Int) -> UIView? {
        return UIView(frame: .zero)
    }
}
