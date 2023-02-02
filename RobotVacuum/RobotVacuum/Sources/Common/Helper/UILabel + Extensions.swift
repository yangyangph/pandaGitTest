import UIKit

extension UILabel {
    
    /// 要在给text后，调用才起效
    @IBInspectable
    public var lineSpace: CGFloat {
        get {
            guard (self.attributedText?.length ?? 0) > 0 else { return 0 }
            
            if let attributedText = self.attributedText, let value = attributedText
                .attribute(NSAttributedString.Key.paragraphStyle, at: 0,
                           effectiveRange: nil) as? NSMutableParagraphStyle
            {
                return value.lineSpacing
            }
            else
            {
                return 0
            }
        }
        set {
            let attributedString = NSMutableAttributedString(string: text ?? "")
            
            let paragraphStyle = NSMutableParagraphStyle()
            
            paragraphStyle.lineSpacing = newValue
            
            attributedString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle,
                                            NSAttributedString.Key.font : font ?? UIFont.systemFont(ofSize: 15)],
                                           range: NSRange(location: 0, length: text?.count ?? 0))
            
            self.attributedText = attributedString
        }
    }
}

