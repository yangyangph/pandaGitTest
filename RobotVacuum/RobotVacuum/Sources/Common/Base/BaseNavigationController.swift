import UIKit

public class BaseNavigationController: UINavigationController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        // 透明度
        navigationBar.isTranslucent = true
        // 设置导航栏底部线条
        navigationController?.navigationBar.shadowImage = UIImage()
        // 背景颜色
        navigationBar.backgroundColor = .clear
        navigationBar.barTintColor = viewBackgroundColor
        // 隐藏二级导航
        //        self.navigationBar.isHidden = true
    }

    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            if viewControllers.count == 1 {
                viewController.hidesBottomBarWhenPushed = true
            }
        } else {
            viewController.hidesBottomBarWhenPushed = false
        }
        super.pushViewController(viewController, animated: animated)
    }

    override public func popViewController(animated _: Bool) -> UIViewController? {
        if children.count == 2 {
            let controller: UIViewController = children[0]
            controller.hidesBottomBarWhenPushed = false
        } else if children.count > 2 {
            let count = children.count - 2
            let controller = children[count]
            controller.hidesBottomBarWhenPushed = true
        }
        return super.popViewController(animated: true)
    }

    @objc func panGesture() {}
}
