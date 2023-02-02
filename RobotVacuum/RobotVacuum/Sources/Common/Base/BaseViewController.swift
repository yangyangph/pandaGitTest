import UIKit

open class BaseViewController: UIViewController {
    var backBtn: UIButton!
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setHiddenBackBtn(isHidden: false)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewBackgroundColor
        setupNavigationBar()
    }

    // 自定义左侧的返回按钮
    func setupNavigationBar() {
        // 返回按钮
        backBtn = UIButton(type: .custom)
        backBtn.frame = CGRect(x: 20, y: 13, width: 18, height: 18)
        backBtn.setImage(Common.Asset.back.image, for: .normal)
        backBtn.addTarget(self, action: #selector(popPreViewController), for: .touchUpInside)
        // 自定义导航栏的UIBarButtonItem类型的按钮
        let backView = UIBarButtonItem(customView: backBtn)
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItem.width = -5
        navigationItem.leftBarButtonItems = [barButtonItem, backView]
    }

    @objc open func popPreViewController() {
        navigationController?.popViewController(animated: true)
    }

    public func setHiddenBackBtn(isHidden: Bool) {
        backBtn.isHidden = isHidden
    }

    override open func touchesBegan(_: Set<UITouch>, with _: UIEvent?) {
        view.endEditing(true)
    }
}
