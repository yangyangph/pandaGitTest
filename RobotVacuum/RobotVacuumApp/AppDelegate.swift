import AccountUI
import Common
import Tabbar
import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            if UserDefaults.standard.bool(forKey: hadLaunchedApp) != true { // 首次启动app
                window?.rootViewController = BaseNavigationController(rootViewController: FirstLaunchViewController())
                window?.makeKeyAndVisible()
            } else {
                  
                DispatchQueue.main.async { [self] in
                            let tabBarController = TabbarViewController()
                            tabBarController.selectedIndex = 0
                            tabBarController.navigationController?.hidesBottomBarWhenPushed = true
                            window?.rootViewController = tabBarController
                       
                        window?.makeKeyAndVisible()
                    }
              
               
            }
        addNotification()
        return true
    }
}

extension AppDelegate {
    func addNotification() {
        let value = AccountUI.notificationNameSwitchRootVC
        NotificationCenter.default.addObserver(self, selector: #selector(switchRootVCNotification(_:)),
                                               name: NSNotification.Name(rawValue: value), object: nil)
    }

    /// 1:login 2: tabbar
    @objc func switchRootVCNotification(_ notification: Notification) {
        if let type = notification.object as? Int {
            switch type {
            case 1:
                let loadPageVC = LoadingPageViewController()
                let rootVC = BaseNavigationController(rootViewController: loadPageVC)
                setupWindowRootViewController(rootVC: rootVC, isAnimation: false)
            case 2:
                setupWindowRootViewController(rootVC: TabbarViewController(), isAnimation: false)
            default:
                break
            }
        }
    }

    private func setupWindowRootViewController(rootVC: UIViewController, isAnimation: Bool = false) {
        if isAnimation {
            UIView.transition(with: Common.keyWindow, duration: 1, options: .transitionFlipFromLeft) {
                Common.keyWindow.rootViewController = BaseNavigationController(rootViewController: rootVC)
            } completion: { _ in
            }
        } else {
            Common.keyWindow.rootViewController = rootVC
        }
    }
}
