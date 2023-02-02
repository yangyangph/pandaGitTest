import UIKit

extension Int {
    public var timestamp2DateStr: String {
        let date = Date(timeIntervalSince1970: TimeInterval(self / 1000))
        let str = date.dateToString(dateFormat: .yyyyMMddSprit)
        return str
    }
}
