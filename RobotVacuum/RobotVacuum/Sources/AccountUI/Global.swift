import Foundation
import UIKit

public let notificationNameSwitchRootVC = "notificationNameSwitchRootVC"
public let hadLaunchedApp = "HadLaunchedApp"

public extension UIImage {
    class func imageName(_ name: String) -> UIImage {
        guard let image = UIImage(named: name, in: Bundle.CommonBundle, compatibleWith: nil) else {
            return UIImage()
        }
        return image.withRenderingMode(.alwaysOriginal)
    }
}

extension Bundle {
    static var CommonBundle: Bundle {
        return Bundle.module
    }
}

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

// 判断手势点击位置是否在给定的区域内
public extension UITapGestureRecognizer {
    func didTapAttibutedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y
        )
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer,
                                                            in: textContainer,
                                                            fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
