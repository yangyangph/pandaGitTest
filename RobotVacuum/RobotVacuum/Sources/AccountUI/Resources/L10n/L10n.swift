// swiftlint:disable all
// swiftformat:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
    internal enum Account {
        /// Account
        internal static let accountName = L10n.tr("Localizable", "account.account_name", fallback: "Account")
        /// Account already registered, please log in
        internal static let alreadyRegistered = L10n.tr("Localizable", "account.already_registered", fallback: "Account already registered, please log in")
        /// Account already exists, please re-enter
        internal static let alreadyRegisteredRetype = L10n.tr("Localizable", "account.already_registered_retype", fallback: "Account already exists, please re-enter")
        /// The area code, mobile number or email address is wrong, please re-enter
        internal static let areaPhoneEmailError = L10n.tr("Localizable", "account.area_phone_email_error", fallback: "The area code, mobile number or email address is wrong, please re-enter")
        /// Account:%@
        internal static func colon(_ p1: Any) -> String {
            return L10n.tr("Localizable", "account.colon", String(describing: p1), fallback: "Account:%@")
        }

        /// Delete Account
        internal static let delete = L10n.tr("Localizable", "account.delete", fallback: "Delete Account")
        /// Go Ahead
        internal static let goAhead = L10n.tr("Localizable", "account.go_ahead", fallback: "Go Ahead")
        /// Enter mobile number/email
        internal static let hint = L10n.tr("Localizable", "account.hint", fallback: "Enter mobile number/email")
        /// Log In
        internal static let login = L10n.tr("Localizable", "account.login", fallback: "Log In")
        /// Account
        internal static let manager = L10n.tr("Localizable", "account.manager", fallback: "Account")
        /// New Password
        internal static let newPassword = L10n.tr("Localizable", "account.new_password", fallback: "New Password")
        /// Old Password
        internal static let oldPassword = L10n.tr("Localizable", "account.old_password", fallback: "Old Password")
        /// Account, Password
        internal static let password = L10n.tr("Localizable", "account.password", fallback: "Account, Password")
        /// Register account
        internal static let register = L10n.tr("Localizable", "account.register", fallback: "Register account")
        /// Log Out
        internal static let signOut = L10n.tr("Localizable", "account.sign_out", fallback: "Log Out")
        /// Are you sure you want to log out?
        internal static let signOutConfirm = L10n.tr("Localizable", "account.sign_out_confirm", fallback: "Are you sure you want to log out?")
        internal enum AProtocol {
            /// I have read and agree to User Agreement and Privacy Policy
            internal static let notice = L10n.tr("Localizable", "account.a_protocol.notice", fallback: "I have read and agree to User Agreement and Privacy Policy")
            internal enum Dialog {
                /// Please read and agree to User Agreement and Privacy Policy
                internal static let notice = L10n.tr("Localizable", "account.a_protocol.dialog.notice", fallback: "Please read and agree to User Agreement and Privacy Policy")
            }
        }

        internal enum AccountOrPassord {
            /// Account or password incorrect, enter again
            internal static let error = L10n.tr("Localizable", "account.account_or_passord.error", fallback: "Account or password incorrect, enter again")
        }

        internal enum AreaAccountPassword {
            /// The area code, account number or password is wrong, please re-enter
            internal static let error = L10n.tr("Localizable", "account.area_account_password.error", fallback: "The area code, account number or password is wrong, please re-enter")
        }

        internal enum AreaCode {
            /// 86
            internal static let `default` = L10n.tr("Localizable", "account.area_code.default", fallback: "86")
        }

        internal enum Confirm {
            /// Confirm
            internal static let delete = L10n.tr("Localizable", "account.confirm.delete", fallback: "Confirm")
            internal enum Passsword {
                /// Password incorrect, enter again
                internal static let error = L10n.tr("Localizable", "account.confirm.passsword.error", fallback: "Password incorrect, enter again")
            }
        }

        internal enum Delete {
            /// Risk of Deleting Account
            internal static let dangerous = L10n.tr("Localizable", "account.delete.dangerous", fallback: "Risk of Deleting Account")
            internal enum Login {
                /// Login Failed
                internal static let fail = L10n.tr("Localizable", "account.delete.login.fail", fallback: "Login Failed")
                internal enum Fail {
                    /// Once deleted, you may not be able to access to %@ and related services with this account.
                    internal static func detail(_ p1: Any) -> String {
                        return L10n.tr("Localizable", "account.delete.login.fail.detail", String(describing: p1), fallback: "Once deleted, you may not be able to access to %@ and related services with this account.")
                    }
                }
            }
        }

        internal enum Email {
            /// Email has been registered
            internal static let registered = L10n.tr("Localizable", "account.email.registered", fallback: "Email has been registered")
            internal enum Format {
                /// E-mail format is incorrect
                internal static let incorrect = L10n.tr("Localizable", "account.email.format.incorrect", fallback: "E-mail format is incorrect")
            }
        }

        internal enum Illegal {
            /// Illegal email
            internal static let email = L10n.tr("Localizable", "account.illegal.email", fallback: "Illegal email")
        }

        internal enum Inconsistent {
            internal enum Password {
                internal enum Entered {
                    /// Password does not match, enter again
                    internal static let twice = L10n.tr("Localizable", "account.inconsistent.password.entered.twice", fallback: "Password does not match, enter again")
                }
            }
        }

        internal enum Info {
            internal enum Change {
                /// Account, change password
                internal static let password = L10n.tr("Localizable", "account.info.change.password", fallback: "Account, change password")
            }
        }

        internal enum Input {
            internal enum Delete {
                /// Enter password to delete account
                internal static let hint = L10n.tr("Localizable", "account.input.delete.hint", fallback: "Enter password to delete account")
            }

            internal enum Name {
                /// 1-16 characters
                internal static let hint = L10n.tr("Localizable", "account.input.name.hint", fallback: "1-16 characters")
                /// Enter 1-16 characters consist of numbers or letters
                internal static let notice = L10n.tr("Localizable", "account.input.name.notice", fallback: "Enter 1-16 characters consist of numbers or letters")
            }
        }

        internal enum Legal {
            /// I have read and agree to User Agreement & Privacy Policy.
            internal static let terms = L10n.tr("Localizable", "account.legal.terms", fallback: "I have read and agree to User Agreement & Privacy Policy.")
            internal enum Terms {
                internal enum User {
                    /// User Agreement
                    internal static let agreement = L10n.tr("Localizable", "account.legal.terms.user.agreement", fallback: "User Agreement")
                }
            }
        }

        internal enum Login {
            /// Login and Security
            internal static let safety = L10n.tr("Localizable", "account.login.safety", fallback: "Login and Security")
        }

        internal enum Message {
            /// Message cleared, unable to recover
            internal static let delete = L10n.tr("Localizable", "account.message.delete", fallback: "Message cleared, unable to recover")
            internal enum Detail {
                /// Deleting your account will delete all messages in %@ and related service platform.
                internal static func delete(_ p1: Any) -> String {
                    return L10n.tr("Localizable", "account.message.detail.delete", String(describing: p1), fallback: "Deleting your account will delete all messages in %@ and related service platform.")
                }
            }
        }

        internal enum My {
            /// About Me
            internal static let info = L10n.tr("Localizable", "account.my.info", fallback: "About Me")
            internal enum Info {
                internal enum Policy {
                    /// Gender and birthday are invisible to others. Complete your information for more personalized services.
                    ///  Privacy Policy
                    internal static let notice = L10n.tr("Localizable", "account.my.info.policy.notice", fallback: "Gender and birthday are invisible to others. Complete your information for more personalized services. \n Privacy Policy")
                }
            }
        }

        internal enum NewPassword {
            /// The new password cannot be the same as the original password
            internal static let notSame = L10n.tr("Localizable", "account.new_password.not_same", fallback: "The new password cannot be the same as the original password")
            internal enum Again {
                /// Enter new password again
                internal static let hint = L10n.tr("Localizable", "account.new_password.again.hint", fallback: "Enter new password again")
            }

            internal enum Set {
                /// New password does not match, enter again
                internal static let inconsistent = L10n.tr("Localizable", "account.new_password.set.inconsistent", fallback: "New password does not match, enter again")
            }
        }

        internal enum Next {
            /// Next step
            internal static let step = L10n.tr("Localizable", "account.next.step", fallback: "Next step")
        }

        internal enum Nick {
            /// Nickname
            internal static let name = L10n.tr("Localizable", "account.nick.name", fallback: "Nickname")
        }

        internal enum Nickname {
            /// Nickname, Birthday
            internal static let birthday = L10n.tr("Localizable", "account.nickname.birthday", fallback: "Nickname, Birthday")
        }

        internal enum OldPassword {
            /// The old password was entered incorrectly
            internal static let incorrectly = L10n.tr("Localizable", "account.old_password.incorrectly", fallback: "The old password was entered incorrectly")
        }

        internal enum Password {
            /// Password incorrect, please enter a combination of 6–14 digits, letters, special characters
            internal static let error = L10n.tr("Localizable", "account.password.error", fallback: "Password incorrect, please enter a combination of 6–14 digits, letters, special characters")
            /// Forget Password
            internal static let forget = L10n.tr("Localizable", "account.password.forget", fallback: "Forget Password")
            /// Enter Password
            internal static let hint = L10n.tr("Localizable", "account.password.hint", fallback: "Enter Password")
            /// Change Password
            internal static let modify = L10n.tr("Localizable", "account.password.modify", fallback: "Change Password")
            /// Reset Password
            internal static let reset = L10n.tr("Localizable", "account.password.reset", fallback: "Reset Password")
            /// 6-14 characters consist of numbers or letters
            internal static let rules = L10n.tr("Localizable", "account.password.rules", fallback: "6-14 characters consist of numbers or letters")
            internal enum Again {
                /// Enter again
                internal static let hint = L10n.tr("Localizable", "account.password.again.hint", fallback: "Enter again")
            }
        }

        internal enum Phone {
            internal enum Number {
                internal enum Format {
                    /// Mobile phone number format is incorrect
                    internal static let incorrect = L10n.tr("Localizable", "account.phone.number.format.incorrect", fallback: "Mobile phone number format is incorrect")
                }
            }
        }

        internal enum Privacy {
            /// Agree
            internal static let agree = L10n.tr("Localizable", "account.privacy.agree", fallback: "Agree")
            /// Privacy protection instructions
            internal static let instructions = L10n.tr("Localizable", "account.privacy.instructions", fallback: "Privacy protection instructions")
            /// Privacy Policy
            internal static let policy = L10n.tr("Localizable", "account.privacy.policy", fallback: "Privacy Policy")
            /// Refuse
            internal static let refuse = L10n.tr("Localizable", "account.privacy.refuse", fallback: "Refuse")
        }

        internal enum Product {
            /// Vacuum
            internal static let name = L10n.tr("Localizable", "account.product.name", fallback: "Vacuum")
        }

        internal enum Signup {
            /// Complete
            internal static let complete = L10n.tr("Localizable", "account.signup.complete", fallback: "Complete")
        }

        internal enum User {
            /// User already exists
            internal static let exist = L10n.tr("Localizable", "account.user.exist", fallback: "User already exists")
            /// account.user.gender
            internal static let gender = L10n.tr("Localizable", "account.user.gender", fallback: "account.user.gender")
            /// Log In
            internal static let login = L10n.tr("Localizable", "account.user.login", fallback: "Log In")
            /// User does not exist
            internal static let notExist = L10n.tr("Localizable", "account.user.not_exist", fallback: "User does not exist")
            /// Register
            internal static let register = L10n.tr("Localizable", "account.user.register", fallback: "Register")
            internal enum Gender {
                /// Male
                internal static let _0 = L10n.tr("Localizable", "account.user.gender.0", fallback: "Male")
                /// Female
                internal static let _1 = L10n.tr("Localizable", "account.user.gender.1", fallback: "Female")
                /// Non-binary
                internal static let _2 = L10n.tr("Localizable", "account.user.gender.2", fallback: "Non-binary")
                /// 3
                internal static let len = L10n.tr("Localizable", "account.user.gender.len", fallback: "3")
            }
        }

        internal enum VerificationCode {
            /// Verification code error
            internal static let error = L10n.tr("Localizable", "account.verification_code.error", fallback: "Verification code error")
            /// Verification code has expired
            internal static let expired = L10n.tr("Localizable", "account.verification_code.expired", fallback: "Verification code has expired")
            /// Get Code
            internal static let get = L10n.tr("Localizable", "account.verification_code.get", fallback: "Get Code")
            /// Verification code already sent
            internal static let hasSend = L10n.tr("Localizable", "account.verification_code.has_send", fallback: "Verification code already sent")
            /// Verification code
            internal static let hint = L10n.tr("Localizable", "account.verification_code.hint", fallback: "Verification code")
            /// The same account can only send a verification code once a minute
            internal static let rule1 = L10n.tr("Localizable", "account.verification_code.rule1", fallback: "The same account can only send a verification code once a minute")
            /// The same account can only send verification codes up to 5 times within an hour
            internal static let rule2 = L10n.tr("Localizable", "account.verification_code.rule2", fallback: "The same account can only send verification codes up to 5 times within an hour")
            /// Maximum delivery within 24 hours of the same issue 10th test
            internal static let rule3 = L10n.tr("Localizable", "account.verification_code.rule3", fallback: "Maximum delivery within 24 hours of the same issue 10th test")
            internal enum Send {
                /// Failed to send verification code
                internal static let fail = L10n.tr("Localizable", "account.verification_code.send.fail", fallback: "Failed to send verification code")
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
