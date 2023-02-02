// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
    internal enum App {
        /// Vacuum
        internal static let name = L10n.tr("Localizable", "app.name", fallback: "Vacuum")
    }
    internal enum Main {
        internal enum Add {
            /// Add device
            internal static let device = L10n.tr("Localizable", "main.add.device", fallback: "Add device")
        }
        internal enum Click {
            internal enum Add {
                /// Click the button below to add a device
                internal static let device = L10n.tr("Localizable", "main.click.add.device", fallback: "Click the button below to add a device")
            }
        }
        internal enum Delete {
            internal enum Device {
                /// Are you sure you want to delete "%@"?
                internal static func tip(_ p1: Any) -> String {
                    return L10n.tr("Localizable", "main.delete.device.tip", String(describing: p1), fallback: "Are you sure you want to delete \"%@\"?")
                }
            }
        }
        internal enum Device {
            /// Really clean, easy care
            internal static let slogen = L10n.tr("Localizable", "main.device.slogen", fallback: "Really clean, easy care")
        }
        internal enum Tab {
            ///
            internal static let device = L10n.tr("Localizable", "main.tab.device", fallback: "")
            /// Messages
            internal static let message = L10n.tr("Localizable", "main.tab.message", fallback: "Messages")
            /// Mine
            internal static let mine = L10n.tr("Localizable", "main.tab.mine", fallback: "Mine")
        }
    }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

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

// Appended by `tech-neutral stres`. DO NOT EDIT!
extension L10n {
    static func getStringArray(key: String) -> [String] {
        let len = Int(L10n.tr("Localizable", "\(key).len", fallback: "0")) ?? 0
        var ret = [String]()

        for index in 0 ..< len {
            ret.append(L10n.tr("Localizable", "\(key).\(index)", fallback: "<no value>"))
        }

        return ret
    }
}

