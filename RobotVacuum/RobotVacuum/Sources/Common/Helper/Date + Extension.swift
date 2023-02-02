import UIKit

extension Date {
    /// DateFormat格式
    public enum DateFormatEnum: String {
        case yyyy           = "yyyy"
        case yyyyMM         = "yyyy-MM"
        case MM             = "MM"
        case M             = "M"
        case MMdd           = "MM-dd"
        case yyyyMMdd       = "yyyy-MM-dd"
        case yyyyMMddSprit  = "yyyy/MM/dd"
        case yyyyMMddHH     = "yyyy-MM-dd HH"
        case yyyyMMddHHmm   = "yyyy-MM-dd HH:mm"
        case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
        
        case HHmmss = "HH:mm:ss"
        case HHmm = "HH:mm"
        
        case dd = "dd"
        
        case yyyyMMddHHmmssFilename = "yyyyMMddHHmmss"
    }
    
    // MARK: - Date 转成 String (默认: 年月日)
    /// Date 转成 String (默认: 年月日)
    ///
    /// - Parameter dateFormat: 日期格式
    /// - Returns: String
    public func dateToString(dateFormat: DateFormatEnum = .yyyyMMdd) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        let str = dateFormatter.string(from: self)
        return str
    }
    
    public func getOtherDayFromNow(after day : Int, dateFormatEnum: DateFormatEnum = .MMdd) -> String {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.init(abbreviation: "UTC")!
        let currenDate = Date()
        var components = DateComponents()
        components.day = day
        components.second = -1
        let dateAtEnd = calendar.date(byAdding: components, to: currenDate)
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = dateFormatEnum.rawValue
        let currentDateStr = dateFormatter.string(from: dateAtEnd!)
        return currentDateStr
    }
    
    public static func setDefaultDateTime(time: String = "23:00") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "HH:mm"
        let date = dateFormatter.date(from: time) ?? Date()
        return date
    }
    
}
