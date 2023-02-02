// swiftlint:disable all
// swiftformat:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#elseif os(tvOS) || os(watchOS)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
    internal static let rectangle = ImageAsset(name: "Rectangle")
    internal static let vacuum = ImageAsset(name: "Vacuum")
    internal static let accessoryIco = ImageAsset(name: "accessory_ico")
    internal static let arrowDown = ImageAsset(name: "arrow_down")
    internal static let avatar = ImageAsset(name: "avatar")
    internal static let back = ImageAsset(name: "back")
    internal static let base = ImageAsset(name: "base")
    internal static let eyeIcon = ImageAsset(name: "eye_icon")
    internal static let halfBase = ImageAsset(name: "half_base")
    internal static let headerIcon = ImageAsset(name: "header_icon")
    internal static let lockIcon = ImageAsset(name: "lock_icon")
    internal static let loginBtn = ImageAsset(name: "loginBtn")
    internal static let logoutCircle = ImageAsset(name: "logout_circle")
    internal static let message = ImageAsset(name: "message")
    internal static let myIcon = ImageAsset(name: "myIcon")
    internal static let selectIcon = ImageAsset(name: "select_icon")
    internal static let unselCircle = ImageAsset(name: "unselCircle")
    internal static let unselectIcon = ImageAsset(name: "unselect_icon")
    internal static let userIcon = ImageAsset(name: "user_icon")
    internal static let veryfyIcon = ImageAsset(name: "veryfy_icon")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
    internal fileprivate(set) var name: String

    #if os(macOS)
    internal typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Image = UIImage
    #endif

    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
    internal var image: Image {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
        let image = Image(named: name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        let name = NSImage.Name(self.name)
        let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
        #elseif os(watchOS)
        let image = Image(named: name)
        #endif
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }

    #if os(iOS) || os(tvOS)
    @available(iOS 8.0, tvOS 9.0, *)
    internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
        let bundle = BundleToken.bundle
        guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }
    #endif

    #if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    internal var swiftUIImage: SwiftUI.Image {
        SwiftUI.Image(asset: self)
    }
    #endif
}

internal extension ImageAsset.Image {
    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
    @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init?(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
        let bundle = BundleToken.bundle
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        self.init(named: NSImage.Name(asset.name))
        #elseif os(watchOS)
        self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
    init(asset: ImageAsset) {
        let bundle = BundleToken.bundle
        self.init(asset.name, bundle: bundle)
    }

    init(asset: ImageAsset, label: Text) {
        let bundle = BundleToken.bundle
        self.init(asset.name, bundle: bundle, label: label)
    }

    init(decorative asset: ImageAsset) {
        let bundle = BundleToken.bundle
        self.init(decorative: asset.name, bundle: bundle)
    }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: BundleToken.self)
        #endif
    }()
}
// swiftlint:enable convenience_type
