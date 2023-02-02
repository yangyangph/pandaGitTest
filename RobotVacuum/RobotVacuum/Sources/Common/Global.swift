import Foundation
import UIKit

public let kAppVersionCode = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String) ?? ""
public let kAppBuildNumber = (Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String) ?? ""
public let configDeviceId = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString

public var keyWindow: UIWindow {
    var window: UIWindow?
    if #available(iOS 13.0, *) {
        window = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .last?.windows
            .filter { $0.isKeyWindow }
            .last
    } else {
        window = UIApplication.shared.keyWindow
    }
    if window == nil {
        window = UIWindow()
    }
    return window!
}

public extension UIImage {
    class func imgName(_ name: String) -> UIImage {
        guard let image = UIImage(named: name, in: Bundle.CommonBundle, compatibleWith: nil) else {
            return UIImage()
        }
        return image.withRenderingMode(.alwaysOriginal)
    }

    class func getImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension Bundle {
    static var CommonBundle: Bundle {
        return Bundle.module
    }
}

public enum LanguageType: String {
    case english
    case chinese
}

public func systemLanguage() -> LanguageType {
    let preferredLanguage = Bundle.main.preferredLocalizations.first! as NSString
    if String(describing: preferredLanguage) == "en" {
        return .english
    }
    return .chinese
}

public let kCellCornerRadius: CGFloat = 16
public let kBtnCornerRadius: CGFloat = 16
public let kBtnHeight: CGFloat = 56
public let kBtnWidth: CGFloat = 220
public let kBtnOffsetBottom: CGFloat = 54
