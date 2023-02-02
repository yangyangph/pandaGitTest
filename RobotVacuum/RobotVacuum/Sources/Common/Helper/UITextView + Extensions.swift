import UIKit

extension UITextView {
    
    public func appendAttributedString(string: String, font: UIFont = UIFont.systemFont(ofSize: 12),
                                       foregroundColor: UIColor = subTitleColor, linkUrlString: String = "") {
        let tempAttrString: NSMutableAttributedString = NSMutableAttributedString()
        tempAttrString.append(self.attributedText)
        
        let attributes = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : foregroundColor]
        let appendString = NSMutableAttributedString(string: string, attributes: attributes)
        
        if linkUrlString != "" {
            let range: NSRange = NSMakeRange(0, appendString.length)
            appendString.addAttribute(.link, value: linkUrlString, range: range)
        }
        tempAttrString.append(appendString)
        self.attributedText = tempAttrString
        self.linkTextAttributes = [NSAttributedString.Key.foregroundColor : foregroundColor]
    }
}
