import Foundation
import UIKit

extension UIColor {
    public class func hex(_ hex: String, alpha: CGFloat) -> UIColor {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
            
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        return UIColor(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
            alpha: alpha
        )
    }
    
    public class func hex(light: String, dark: String, alpha: CGFloat = 1.0) -> UIColor {
        if #available(iOS 13.0, *) {
            let color = UIColor.init { trainCollection in
                if trainCollection.userInterfaceStyle == UIUserInterfaceStyle.dark {
                    return hex(dark, alpha: alpha)
                } else {
                    return hex(light, alpha: alpha)
                }
            }
            return color
        }
        return hex(light, alpha: alpha)
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
            
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
            
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
            alpha: alpha
        )
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
}

extension UIColor
{
    public static var themeText = UIColor.hex(light: "2DA74E", dark: "2DA74E")
}
