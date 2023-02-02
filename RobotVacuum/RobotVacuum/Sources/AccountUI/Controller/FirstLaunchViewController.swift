import Common
import UIKit

public class FirstLaunchViewController: BaseViewController {
    var contentView: PrivacyPolicyView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        contentView = PrivacyPolicyView(frame: .zero)
        view.addSubview(contentView)
        contentView.frame = view.bounds

        contentView.buttonTapBlock = { type in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) { [self] in
                if type == .cancel { // 拒绝直接退出app
                    exit(0)
                } else { // 同意进入落地页
                    UserDefaults.standard.setValue(true, forKey: hadLaunchedApp)
                    UserDefaults.standard.synchronize()
                    navigationController?.pushViewController(LoadingPageViewController(), animated: true)
                }
            }
        }
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
