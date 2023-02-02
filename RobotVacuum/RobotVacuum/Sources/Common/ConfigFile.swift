import Foundation
import UIKit

// 屏幕宽度
let SCREENWIDTH = UIScreen.main.bounds.size.width
// 屏幕高度
let SCREENHEIGHT = UIScreen.main.bounds.size.height

// 状态栏高度
let STATUSBARHIGH = isiPhoneXSeries() ? 44 : 20

// 导航栏高度
let NAVHIGH = 44

// tabbar高度
let TABBARHEIGHT = isiPhoneXSeries() ? 83.0 : 49.0

// tabbar 安全区域的高度
let TABBARHEIGHTSAFE = isiPhoneXSeries() ? 34.0 : 0.0

// AppDelegate
let APPDELEGATE = UIApplication.shared.delegate

// Window
let KWINDOW = UIApplication.shared.delegate?.window

// Default
let USERDEFAULTS = UserDefaults.standard

// 沙盒路径
let DOCUMENTPATH = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                       FileManager.SearchPathDomainMask.userDomainMask, true)

// 字符串是否为空
func isURLString(ref: String) -> (Bool) {
    var result = false
    if !ref.isEmpty && (ref.hasPrefix("https://") || ref.hasPrefix("http://")) {
        result = true
    }
    return result
}

// 字符串中是否包含某字符串
func stringContainsSubString(string: String, subString: String) -> (Bool) {
    let range = string.range(of: subString)
    if range == nil {
        return false
    }
    return true
}

// 十进制颜色
public func RGBCOLOR(red: CGFloat, green: CGFloat, blue: CGFloat) -> (UIColor) {
    return RGBACOLOR(red: red, green: green, blue: blue, alpha: 1.0)
}

public func RGBACOLOR(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> (UIColor) {
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
}

// 16进制颜色转UIColor
public func HEXCOLOR(color: UInt64) -> (UIColor) {
    let redValue = CGFloat((color & 0xFF0000) >> 16)/255.0
    let greenValue = CGFloat((color & 0xFF00) >> 8)/255.0
    let blueValue = CGFloat(color & 0xFF)/255.0
    return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
}

// 字体
func FONTSIZE(size: CGFloat) -> (UIFont) {
    return UIFont.systemFont(ofSize: CGFloat(size))
}

// 加粗字体
func boldFontSize(size: CGFloat) -> (UIFont) {
    return UIFont.boldSystemFont(ofSize: size)
}

/**
 布局转化
 round  如果参数是小数  则求本身的四舍五入.
 ceil   如果参数是小数  则求最小的整数但不小于本身.
 floor  如果参数是小数  则求最大的整数但不大于本身.
 */
func adaptive375(width: CGFloat) -> (CGFloat) {
    let newWidth = round((width)*UIScreen.main.bounds.size.width/375.0)
    return newWidth
}

// 适配 判断系统版本
func adaptiveiOSSystem(version: Float) -> (Bool) {
    let sysVer = Float(UIDevice.current.systemVersion) ?? 0.0
    if sysVer >= version {
        return true
    }
    return false
}

// 判断是否设备是iphoneX系列
func isiPhoneXSeries() -> (Bool) {
    let boundsSize = UIScreen.main.bounds.size
    // iPhoneX,XS
    let xxs = CGSize(width: 375, height: 812)
    if __CGSizeEqualToSize(boundsSize, xxs) {
        return true
    }
    // iPhoneXS Max,XR
    let xsmaxr = CGSize(width: 414, height: 896)
    if __CGSizeEqualToSize(boundsSize, xsmaxr) {
        return true
    }
    return false
}

// 判断iPhoneX
func isiPhoneX() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 1125, height: 2436))
}

// 判断iPhoneXS
func isiPhoneXS() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 1125, height: 2436))
}

// 判断iPHoneXR
func isiPhoneXR() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 828, height: 1792))
}

// 判断iPhoneXS Max
func isiPhoneXSMax() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 1242, height: 2688))
}

// 判断iPhone8 Plus
func isiPhone8Plus() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 1080, height: 1920))
}

// 判断iPhone8
func isiPhone8() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 750, height: 1334))
}

// 判断iPhone7 Plus
func isiPhone7Plus() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 1080, height: 1920))
}

// 判断iPhone7
func isiPhone7() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 750, height: 1334))
}

// 判断iPhone6S Plus
func isiPhone6SPlus() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 1080, height: 1920))
}

// 判断iPhone6S
func isiPhone6S() -> (Bool) {
    return compareIPhoneSize(size: CGSize(width: 750, height: 1334))
}

// 设备是否是iPad
func isiPad() -> (Bool) {
    if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
        return true
    }
    return false
}

func compareIPhoneSize(size: CGSize) -> (Bool) {
    if !isiPad() {
        guard let currentSize = UIScreen.main.currentMode?.size else {
            return false
        }
        if __CGSizeEqualToSize(size, currentSize) {
            return true
        }
    }
    return false
}
