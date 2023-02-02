import Foundation
import UIKit

enum TabbarItemTag: Int {
    case tabbarItemDevice
    case tabbarItemMessage
    case tabbarItemCat
}

class TabbarItemView: UITabBarItem {
    override init() {
        super.init()
        self.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
