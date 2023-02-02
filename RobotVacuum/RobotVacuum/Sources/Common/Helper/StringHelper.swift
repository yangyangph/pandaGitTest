import Foundation
import UIKit

extension String {
    
    public func getHeight(font: UIFont, width: CGFloat, lineSpacing: CGFloat = 0) -> CGFloat {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = lineSpacing
        let height = self.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
                                       options: [.usesLineFragmentOrigin, .usesFontLeading],
                                       attributes: [NSAttributedString.Key.font : font,
                                                    NSAttributedString.Key.paragraphStyle : paragraph],
                                       context: nil).size.height
        return ceil(height)
    }
    
    public func getWidth(font: UIFont, height: CGFloat) -> CGFloat {
        let width = self.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height),
                                      options: [.usesLineFragmentOrigin, .usesFontLeading],
                                      attributes: [NSAttributedString.Key.font : font], context: nil).size.width
        return ceil(width)
    }
    
    public func stringHeightWith(fontSize: CGFloat, width: CGFloat, lineSpacing: CGFloat? = nil) -> CGFloat {
        let font = UIFont.systemFont(ofSize: fontSize)
        let size = CGSize(width: width, height: 10000)
        let paragraphStyle =  NSMutableParagraphStyle()
        if let lineSpacing = lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing
        }
        paragraphStyle.lineBreakMode = NSLineBreakMode.byCharWrapping;
        let rect = self.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font: font], context: nil)
        return rect.size.height
    }
    
    public func stringWidthWith(font: UIFont) -> CGFloat {
        let str = self as NSString
        let size = CGSize(width: 10000, height: 20)
        let attributes = [NSAttributedString.Key.font: font]
        let labelSize = str.boundingRect(with: size, options: .usesLineFragmentOrigin,
                                         attributes: attributes, context: nil).size
        return labelSize.width
    }
    
    public func attributedString(with style: [NSAttributedString.Key: Any]? = nil,
                                 and highlightedText: String,
                                 with highlightedTextStyle: [NSAttributedString.Key: Any]? = nil)
    -> NSAttributedString {
        let formattedString = NSMutableAttributedString(string: self, attributes: style)
        let highlightedTextRange: NSRange = (self as NSString).range(of: highlightedText as String)
        formattedString.setAttributes(highlightedTextStyle, range: highlightedTextRange)
        return formattedString
    }
    
    public func indexOf(string : String) -> Int {
        var index = -1
        if let range = self.range(of : string) {
            if !range.isEmpty {
                index = distance(from : self.startIndex, to : range.lowerBound)
            }
        }
        return index
    }
}


extension NSMutableAttributedString {
    public func addFont(_ font: UIFont, range: NSRange) {
        if self.length < range.location + range.length { return }
        
        let attrs = [NSAttributedString.Key.font: font]
        self.addAttributes(attrs, range: range)
    }
    
}
