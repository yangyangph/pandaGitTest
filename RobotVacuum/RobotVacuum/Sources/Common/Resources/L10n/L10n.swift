// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
    public enum Common {
        /// Accept
        public static let accept = L10n.tr("Localizable", "common.accept", fallback: "Accept")
        /// Agree
        public static let agree = L10n.tr("Localizable", "common.agree", fallback: "Agree")
        /// Apr.
        public static let april = L10n.tr("Localizable", "common.april", fallback: "Apr.")
        /// Code
        public static let areaCode = L10n.tr("Localizable", "common.area_code", fallback: "Code")
        /// Aug.
        public static let august = L10n.tr("Localizable", "common.august", fallback: "Aug.")
        /// Back
        public static let back = L10n.tr("Localizable", "common.back", fallback: "Back")
        /// Birthday
        public static let birthday = L10n.tr("Localizable", "common.birthday", fallback: "Birthday")
        /// Cancel
        public static let cancel = L10n.tr("Localizable", "common.cancel", fallback: "Cancel")
        /// Close
        public static let close = L10n.tr("Localizable", "common.close", fallback: "Close")
        /// Submit
        public static let commit = L10n.tr("Localizable", "common.commit", fallback: "Submit")
        /// Confirm
        public static let confirm = L10n.tr("Localizable", "common.confirm", fallback: "Confirm")
        /// Confirmed
        public static let confirmed = L10n.tr("Localizable", "common.confirmed", fallback: "Confirmed")
        /// Dec.
        public static let december = L10n.tr("Localizable", "common.december", fallback: "Dec.")
        /// Delete
        public static let delete = L10n.tr("Localizable", "common.delete", fallback: "Delete")
        /// Exit
        public static let exit = L10n.tr("Localizable", "common.exit", fallback: "Exit")
        /// Feb.
        public static let february = L10n.tr("Localizable", "common.february", fallback: "Feb.")
        /// Friday
        public static let friday = L10n.tr("Localizable", "common.friday", fallback: "Friday")
        /// Gender
        public static let gender = L10n.tr("Localizable", "common.gender", fallback: "Gender")
        /// Help
        public static let help = L10n.tr("Localizable", "common.help", fallback: "Help")
        /// Install
        public static let install = L10n.tr("Localizable", "common.install", fallback: "Install")
        /// Jan.
        public static let january = L10n.tr("Localizable", "common.january", fallback: "Jan.")
        /// Jul.
        public static let july = L10n.tr("Localizable", "common.july", fallback: "Jul.")
        /// Jun.
        public static let june = L10n.tr("Localizable", "common.june", fallback: "Jun.")
        /// Loading...
        public static let loading = L10n.tr("Localizable", "common.loading", fallback: "Loading...")
        /// Mar.
        public static let march = L10n.tr("Localizable", "common.march", fallback: "Mar.")
        /// May.
        public static let may = L10n.tr("Localizable", "common.may", fallback: "May.")
        /// Minute
        public static let minute = L10n.tr("Localizable", "common.minute", fallback: "Minute")
        /// Monday
        public static let monday = L10n.tr("Localizable", "common.monday", fallback: "Monday")
        /// Notifications
        public static let notice = L10n.tr("Localizable", "common.notice", fallback: "Notifications")
        /// Nov.
        public static let november = L10n.tr("Localizable", "common.november", fallback: "Nov.")
        /// Null
        public static let null = L10n.tr("Localizable", "common.null", fallback: "Null")
        /// Oct.
        public static let october = L10n.tr("Localizable", "common.october", fallback: "Oct.")
        /// Take Photo
        public static let photograph = L10n.tr("Localizable", "common.photograph", fallback: "Take Photo")
        /// Retry
        public static let retry = L10n.tr("Localizable", "common.retry", fallback: "Retry")
        /// Saturday
        public static let saturday = L10n.tr("Localizable", "common.saturday", fallback: "Saturday")
        /// Save
        public static let save = L10n.tr("Localizable", "common.save", fallback: "Save")
        /// Search
        public static let search = L10n.tr("Localizable", "common.search", fallback: "Search")
        /// Sep.
        public static let september = L10n.tr("Localizable", "common.september", fallback: "Sep.")
        /// Settings
        public static let `set` = L10n.tr("Localizable", "common.set", fallback: "Settings")
        /// Sunday
        public static let sunday = L10n.tr("Localizable", "common.sunday", fallback: "Sunday")
        /// Confirm
        public static let sure = L10n.tr("Localizable", "common.sure", fallback: "Confirm")
        /// Thursday
        public static let thursday = L10n.tr("Localizable", "common.thursday", fallback: "Thursday")
        /// Tuesday
        public static let tuesday = L10n.tr("Localizable", "common.tuesday", fallback: "Tuesday")
        /// OK
        public static let understood = L10n.tr("Localizable", "common.understood", fallback: "OK")
        /// Update
        public static let update = L10n.tr("Localizable", "common.update", fallback: "Update")
        /// Wednesday
        public static let wednesday = L10n.tr("Localizable", "common.wednesday", fallback: "Wednesday")
        public enum About {
            /// About us
            public static let us = L10n.tr("Localizable", "common.about.us", fallback: "About us")
        }
        public enum Account {
            public enum Kick {
                /// Account is currently logged in on another device, please log in again.
                public static let off = L10n.tr("Localizable", "common.account.kick.off", fallback: "Account is currently logged in on another device, please log in again.")
            }
        }
        public enum Album {
            /// Choose From Album
            public static let choose = L10n.tr("Localizable", "common.album.choose", fallback: "Choose From Album")
        }
        public enum App {
            /// App Version
            public static let version = L10n.tr("Localizable", "common.app.version", fallback: "App Version")
            public enum New {
                /// New Version
                public static let version = L10n.tr("Localizable", "common.app.new.version", fallback: "New Version")
            }
        }
        public enum Camera {
            public enum Permission {
                /// Access to Camera
                public static let request = L10n.tr("Localizable", "common.camera.permission.request", fallback: "Access to Camera")
            }
        }
        public enum Check {
            /// View Updates
            public static let updating = L10n.tr("Localizable", "common.check.updating", fallback: "View Updates")
            public enum Network {
                public enum And {
                    /// Check the network and try again
                    public static let retry = L10n.tr("Localizable", "common.check.network.and.retry", fallback: "Check the network and try again")
                }
            }
        }
        public enum Choose {
            /// Please select
            public static let notice = L10n.tr("Localizable", "common.choose.notice", fallback: "Please select")
        }
        public enum Commit {
            /// Submit failed
            public static let fail = L10n.tr("Localizable", "common.commit.fail", fallback: "Submit failed")
            /// Submitted
            public static let success = L10n.tr("Localizable", "common.commit.success", fallback: "Submitted")
        }
        public enum Confirm {
            /// Are you sure to delete?
            public static let delete = L10n.tr("Localizable", "common.confirm.delete", fallback: "Are you sure to delete?")
        }
        public enum Current {
            public enum Version {
                /// Current version %@
                public static func value(_ p1: Any) -> String {
                    return L10n.tr("Localizable", "common.current.version.value", String(describing: p1), fallback: "Current version %@")
                }
            }
        }
        public enum Customer {
            /// Customer service
            public static let service = L10n.tr("Localizable", "common.customer.service", fallback: "Customer service")
        }
        public enum Default {
            public enum Update {
                /// Bug fixes and performance improvements
                public static let statement = L10n.tr("Localizable", "common.default.update.statement", fallback: "Bug fixes and performance improvements")
            }
        }
        public enum Description {
            /// Blank
            public static let blank = L10n.tr("Localizable", "common.description.blank", fallback: "Blank")
        }
        public enum Detect {
            public enum New {
                /// New Version Available
                public static let version = L10n.tr("Localizable", "common.detect.new.version", fallback: "New Version Available")
            }
        }
        public enum Dev {
            public enum Busy {
                /// Device is running, try again later~
                public static let notice = L10n.tr("Localizable", "common.dev.busy.notice", fallback: "Device is running, try again later~")
            }
            public enum Offline {
                /// Device offline, try again later~
                public static let notice = L10n.tr("Localizable", "common.dev.offline.notice", fallback: "Device offline, try again later~")
            }
            public enum Operation {
                public enum Frequently {
                    /// Operate too often, try again later~
                    public static let notice = L10n.tr("Localizable", "common.dev.operation.frequently.notice", fallback: "Operate too often, try again later~")
                }
            }
            public enum State {
                public enum Error {
                    /// Device abnormal, check and try again later~
                    public static let notice = L10n.tr("Localizable", "common.dev.state.error.notice", fallback: "Device abnormal, check and try again later~")
                }
            }
        }
        public enum Device {
            /// Updating...
            public static let updating = L10n.tr("Localizable", "common.device.updating", fallback: "Updating...")
            public enum Bind {
                public enum By {
                    /// Device is currently connected to another account. This account is unbound automatically.
                    public static let others = L10n.tr("Localizable", "common.device.bind.by.others", fallback: "Device is currently connected to another account. This account is unbound automatically.")
                }
            }
        }
        public enum Download {
            /// Download failed
            public static let failed = L10n.tr("Localizable", "common.download.failed", fallback: "Download failed")
            /// Download successfully
            public static let success = L10n.tr("Localizable", "common.download.success", fallback: "Download successfully")
        }
        public enum Find {
            public enum New {
                /// New Version Available
                public static let version = L10n.tr("Localizable", "common.find.new.version", fallback: "New Version Available")
            }
        }
        public enum Firmware {
            /// Firmware Version
            public static let version = L10n.tr("Localizable", "common.firmware.version", fallback: "Firmware Version")
        }
        public enum Force {
            public enum Update {
                public enum Notice {
                    /// 1. Make sure that the device is plugged in with Bluetooth connected
                    /// 2. To avoid update failure, do not leave or exit the APP during update
                    /// 3. Should you have any problems, contact Customer Service
                    public static let detail = L10n.tr("Localizable", "common.force.update.notice.detail", fallback: "1. Make sure that the device is plugged in with Bluetooth connected \n2. To avoid update failure, do not leave or exit the APP during update \n3. Should you have any problems, contact Customer Service")
                }
            }
        }
        public enum Fragment {
            /// Device
            public static let device = L10n.tr("Localizable", "common.fragment.device", fallback: "Device")
            /// Messages
            public static let message = L10n.tr("Localizable", "common.fragment.message", fallback: "Messages")
        }
        public enum Get {
            public enum Config {
                /// Unable to access to configuration information
                public static let fail = L10n.tr("Localizable", "common.get.config.fail", fallback: "Unable to access to configuration information")
            }
        }
        public enum Go {
            public enum To {
                /// To set
                public static let setting = L10n.tr("Localizable", "common.go.to.setting", fallback: "To set")
            }
        }
        public enum I {
            /// OK
            public static let understood = L10n.tr("Localizable", "common.i.understood", fallback: "OK")
        }
        public enum Input {
            /// Please enter (required)
            public static let notice = L10n.tr("Localizable", "common.input.notice", fallback: "Please enter (required)")
        }
        public enum Kind {
            /// Kindly Reminder
            public static let tips = L10n.tr("Localizable", "common.kind.tips", fallback: "Kindly Reminder")
        }
        public enum Location {
            public enum Permission {
                /// Access to Location
                public static let request = L10n.tr("Localizable", "common.location.permission.request", fallback: "Access to Location")
                public enum Scan {
                    public enum Wifi {
                        /// Access to Location to scan WLAN list
                        public static let request = L10n.tr("Localizable", "common.location.permission.scan.wifi.request", fallback: "Access to Location to scan WLAN list")
                    }
                }
            }
        }
        public enum Nearby {
            public enum Equipment {
                public enum Permission {
                    /// Access to Device Nearby
                    public static let request = L10n.tr("Localizable", "common.nearby.equipment.permission.request", fallback: "Access to Device Nearby")
                }
            }
        }
        public enum Network {
            /// Network error, try again later~
            public static let unable = L10n.tr("Localizable", "common.network.unable", fallback: "Network error, try again later~")
            public enum Unable {
                /// Network Connection Failed
                public static let content = L10n.tr("Localizable", "common.network.unable.content", fallback: "Network Connection Failed")
                /// Cellular network or WLAN not enabled
                public static let content1 = L10n.tr("Localizable", "common.network.unable.content1", fallback: "Cellular network or WLAN not enabled")
                /// To connect to network, try the following steps:s
                public static let content2 = L10n.tr("Localizable", "common.network.unable.content2", fallback: "To connect to network, try the following steps:s")
                /// Go to "Settings" - "WLAN" to select an available network.
                public static let content3 = L10n.tr("Localizable", "common.network.unable.content3", fallback: "Go to \"Settings\" - \"WLAN\" to select an available network.")
                /// Go to "Settings" - "Cellular" to enable cellular data (Carrier may charge for data usage).
                public static let content4 = L10n.tr("Localizable", "common.network.unable.content4", fallback: "Go to \"Settings\" - \"Cellular\" to enable cellular data (Carrier may charge for data usage).")
                /// If already connected to network:
                public static let content5 = L10n.tr("Localizable", "common.network.unable.content5", fallback: "If already connected to network:")
                /// Check if the selected network is available or your device is allowed to access the Internet.
                public static let content6 = L10n.tr("Localizable", "common.network.unable.content6", fallback: "Check if the selected network is available or your device is allowed to access the Internet.")
                /// Network Not Available
                public static let title = L10n.tr("Localizable", "common.network.unable.title", fallback: "Network Not Available")
            }
        }
        public enum New {
            public enum Version {
                /// Latest Version %@
                public static func value(_ p1: Any) -> String {
                    return L10n.tr("Localizable", "common.new.version.value", String(describing: p1), fallback: "Latest Version %@")
                }
            }
        }
        public enum Next {
            /// Next
            public static let step = L10n.tr("Localizable", "common.next.step", fallback: "Next")
        }
        public enum Nick {
            public enum Name {
                public enum Length {
                    /// Maximum length of nickname:16 characters
                    public static let notice = L10n.tr("Localizable", "common.nick.name.length.notice", fallback: "Maximum length of nickname:16 characters")
                }
                public enum Not {
                    /// Nickname must not be empty
                    public static let empty = L10n.tr("Localizable", "common.nick.name.not.empty", fallback: "Nickname must not be empty")
                }
            }
        }
        public enum No {
            public enum More {
                /// Turn OFF Notification
                public static let notice = L10n.tr("Localizable", "common.no.more.notice", fallback: "Turn OFF Notification")
            }
            public enum Network {
                /// Network error, check your network
                public static let check = L10n.tr("Localizable", "common.no.network.check", fallback: "Network error, check your network")
            }
        }
        public enum Notification {
            /// Notification settings
            public static let setting = L10n.tr("Localizable", "common.notification.setting", fallback: "Notification settings")
        }
        public enum Oppo {
            public enum Camera {
                public enum Permission {
                    /// "Smart Home" would like to access the Camera to take photos
                    public static let request = L10n.tr("Localizable", "common.oppo.camera.permission.request", fallback: "\"Smart Home\" would like to access the Camera to take photos")
                }
            }
            public enum Request {
                public enum Camera {
                    /// "Smart Home" would like to access the Camera to take photos
                    public static let content = L10n.tr("Localizable", "common.oppo.request.camera.content", fallback: "\"Smart Home\" would like to access the Camera to take photos")
                }
            }
        }
        public enum Permission {
            /// Permission Statement
            public static let statement = L10n.tr("Localizable", "common.permission.statement", fallback: "Permission Statement")
        }
        public enum Person {
            public enum Info {
                /// User Information Collected
                public static let list = L10n.tr("Localizable", "common.person.info.list", fallback: "User Information Collected")
            }
        }
        public enum Refresh {
            public enum Network {
                /// Unstable network, tap to refresh
                public static let notice = L10n.tr("Localizable", "common.refresh.network.notice", fallback: "Unstable network, tap to refresh")
            }
        }
        public enum Request {
            public enum Camera {
                /// Allow Access to the Camera
                public static let title = L10n.tr("Localizable", "common.request.camera.title", fallback: "Allow Access to the Camera")
                public enum Album {
                    /// Allow access to Photos on your phone,
                    ///  to complete profile photo setting.
                    public static let content = L10n.tr("Localizable", "common.request.camera.album.content", fallback: "Allow access to Photos on your phone, \n to complete profile photo setting.")
                    /// Allow Access to your Photos
                    public static let title = L10n.tr("Localizable", "common.request.camera.album.title", fallback: "Allow Access to your Photos")
                }
            }
        }
        public enum Revoke {
            /// Cancel Agreement
            public static let privacy = L10n.tr("Localizable", "common.revoke.privacy", fallback: "Cancel Agreement")
            public enum Privacy {
                /// Confirm & Exit
                public static let exit = L10n.tr("Localizable", "common.revoke.privacy.exit", fallback: "Confirm & Exit")
                /// You will exit after canceled agreement. The account-related data will not be cleared. To use the data again, you shall agree and log in again. Are you sure to exit?
                public static let notice = L10n.tr("Localizable", "common.revoke.privacy.notice", fallback: "You will exit after canceled agreement. The account-related data will not be cleared. To use the data again, you shall agree and log in again. Are you sure to exit?")
            }
        }
        public enum Save {
            /// Saved successfully
            public static let success = L10n.tr("Localizable", "common.save.success", fallback: "Saved successfully")
        }
        public enum Search {
            /// Search area code
            public static let areaCode = L10n.tr("Localizable", "common.search.area_code", fallback: "Search area code")
        }
        public enum Sensitive {
            /// Identified as sensitive photo, please upload again
            public static let img = L10n.tr("Localizable", "common.sensitive.img", fallback: "Identified as sensitive photo, please upload again")
            /// Name contains sensitive words, please enter again
            public static let text = L10n.tr("Localizable", "common.sensitive.text", fallback: "Name contains sensitive words, please enter again")
        }
        public enum Server {
            /// Server error, try again later ~
            public static let error = L10n.tr("Localizable", "common.server.error", fallback: "Server error, try again later ~")
        }
        public enum Share {
            public enum Device {
                public enum Permission {
                    /// The shared user is currently not authorized to operate
                    public static let deny = L10n.tr("Localizable", "common.share.device.permission.deny", fallback: "The shared user is currently not authorized to operate")
                }
            }
        }
        public enum Storage {
            public enum Permission {
                /// Access to Storage
                public static let request = L10n.tr("Localizable", "common.storage.permission.request", fallback: "Access to Storage")
            }
        }
        public enum System {
            public enum Permission {
                /// List of Privileges
                public static let list = L10n.tr("Localizable", "common.system.permission.list", fallback: "List of Privileges")
            }
        }
        public enum Third {
            public enum Person {
                public enum Info {
                    /// Collected by Third-Party
                    public static let list = L10n.tr("Localizable", "common.third.person.info.list", fallback: "Collected by Third-Party")
                }
            }
        }
        public enum Ubt {
            public enum Camera {
                public enum Permission {
                    /// "%@" would like to access the Camera to take photos
                    public static func request(_ p1: Any) -> String {
                        return L10n.tr("Localizable", "common.ubt.camera.permission.request", String(describing: p1), fallback: "\"%@\" would like to access the Camera to take photos")
                    }
                }
            }
            public enum Request {
                public enum Camera {
                    /// "%@" would like to access the Camera to take photos
                    public static func content(_ p1: Any) -> String {
                        return L10n.tr("Localizable", "common.ubt.request.camera.content", String(describing: p1), fallback: "\"%@\" would like to access the Camera to take photos")
                    }
                }
            }
        }
        public enum Update {
            /// Update failed
            public static let failed = L10n.tr("Localizable", "common.update.failed", fallback: "Update failed")
            /// Update Later
            public static let later = L10n.tr("Localizable", "common.update.later", fallback: "Update Later")
            /// Notes for Update
            public static let notice = L10n.tr("Localizable", "common.update.notice", fallback: "Notes for Update")
            /// Update Now
            public static let now = L10n.tr("Localizable", "common.update.now", fallback: "Update Now")
            /// Updating...
            public static let running = L10n.tr("Localizable", "common.update.running", fallback: "Updating...")
            /// What's New
            public static let statement = L10n.tr("Localizable", "common.update.statement", fallback: "What's New")
            public enum Check {
                /// View details
                public static let detail = L10n.tr("Localizable", "common.update.check.detail", fallback: "View details")
            }
            public enum Download {
                /// Downloading %d%%
                public static func value(_ p1: Int) -> String {
                    return L10n.tr("Localizable", "common.update.download.value", p1, fallback: "Downloading %d%%")
                }
            }
            public enum Error {
                /// Device offline, check the network and try again
                public static let offline = L10n.tr("Localizable", "common.update.error.offline", fallback: "Device offline, check the network and try again")
                /// Device is running or error occurs, check and try again
                public static let state = L10n.tr("Localizable", "common.update.error.state", fallback: "Device is running or error occurs, check and try again")
                /// Update timeout, check the device and network and try again
                public static let timeout = L10n.tr("Localizable", "common.update.error.timeout", fallback: "Update timeout, check the device and network and try again")
            }
            public enum In {
                /// Background Update
                public static let background = L10n.tr("Localizable", "common.update.in.background", fallback: "Background Update")
            }
            public enum Latest {
                /// Your version is up to date
                public static let version = L10n.tr("Localizable", "common.update.latest.version", fallback: "Your version is up to date")
            }
            public enum Notice {
                /// 1. Make sure that the device is plugged in with network connected and in standby mode without any abnormalities (except weighing error)
                /// 2. Should you have any problems, contact Customer Service
                public static let detail = L10n.tr("Localizable", "common.update.notice.detail", fallback: "1. Make sure that the device is plugged in with network connected and in standby mode without any abnormalities (except weighing error) \n2. Should you have any problems, contact Customer Service")
            }
        }
        public enum Updating {
            public enum Device {
                public enum Can {
                    public enum Not {
                        /// During firmware update, you are not able to operate the device
                        public static let control = L10n.tr("Localizable", "common.updating.device.can.not.control", fallback: "During firmware update, you are not able to operate the device")
                    }
                }
            }
            public enum Net {
                /// Make sure that the device is plugged in with network connected during update
                public static let tip = L10n.tr("Localizable", "common.updating.net.tip", fallback: "Make sure that the device is plugged in with network connected during update")
            }
            public enum Restart {
                /// The device will reboot during update
                public static let tip = L10n.tr("Localizable", "common.updating.restart.tip", fallback: "The device will reboot during update")
            }
        }
        public enum User {
            /// User Agreement
            public static let agreement = L10n.tr("Localizable", "common.user.agreement", fallback: "User Agreement")
            /// User Manual
            public static let directions = L10n.tr("Localizable", "common.user.directions", fallback: "User Manual")
            /// Privacy Policy
            public static let privacy = L10n.tr("Localizable", "common.user.privacy", fallback: "Privacy Policy")
        }
        public enum Weak {
            public enum Network {
                /// Unstable network, tap to refresh
                public static let check = L10n.tr("Localizable", "common.weak.network.check", fallback: "Unstable network, tap to refresh")
            }
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

