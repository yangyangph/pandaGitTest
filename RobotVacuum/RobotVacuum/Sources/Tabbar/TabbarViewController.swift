import AccountUI
import Common
import UIKit

public class TabbarViewController: UITabBarController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge.all

        let bgview = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.bounds.width,
                                          height: tabBar.bounds.height + UIDevice.rv_safeDistanceBottom()))
        bgview.backgroundColor = contentBackgroundColor
        tabBar.addSubview(bgview)
        // 整个背景
        view.backgroundColor = contentBackgroundColor
        initTabbarItems()
        // tabbar 颜色
        tabBar.tintColor = mainTitleColor
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = subTitleColor
        }
    }

    func initTabbarItems() {
        let deviceMainVC = BaseNavigationController(rootViewController: LoginViewController())
        let personalVC = BaseNavigationController(rootViewController: PersonalSettingViewController())
        let img = Tabbar.Asset.tabbarDeviceIconUnSelect.image
        let selectImg = Tabbar.Asset.tabbarDeviceIconSelect.image
        let renderMode = UIImage.RenderingMode.alwaysOriginal
        deviceMainVC.tabBarItem = TabbarItemView(title: "",
                                                 image: img.withRenderingMode(renderMode),
                                                 selectedImage: selectImg.withRenderingMode(renderMode))
        deviceMainVC.tabBarItem.tag = TabbarItemTag.tabbarItemDevice.rawValue
        let loadImg = Tabbar.Asset.myIcon.image
        let loadSelImg = Tabbar.Asset.myIcon.image
        personalVC.tabBarItem = TabbarItemView(title: L10n.Main.Tab.mine,
                                               image: loadImg, selectedImage: loadSelImg)
        personalVC.tabBarItem.tag = TabbarItemTag.tabbarItemCat.rawValue
        viewControllers = [deviceMainVC, personalVC]
    }
}
