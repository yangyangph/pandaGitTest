import Foundation
import UIKit

extension UIImage {
    class func name(_ name: String) -> UIImage {
        guard let image = UIImage.init(named: name, in: Bundle.CommonBundle, compatibleWith: nil)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal) else { return UIImage.init() }
        return image
    }
}

extension UIView {
    public func addCorner(conrners: UIRectCorner , radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    // MARK: - 扩展UIView，渐变功能
    /// 扩展UIView，渐变功能
    /// - Parameters:
    ///   - startColor: 开始颜色
    ///   - endColor: 结束颜色
    ///   - direction: 渐变方向
    public func gradient(startColor: UIColor, endColor: UIColor, direction: GradientDirections)
    {
        
        let gradientLayer = CAGradientLayer().gradientLayer(startColor: startColor, endColor: endColor, direction: direction)
        
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: - 扩展UIView，清除渐变
    /// 扩展UIView，清除渐变
    public func removeGradient()
    {
        if let sublayers = self.layer.sublayers
        {
            for sub in sublayers
            {
                if sub is CAGradientLayer
                {
                    sub.removeFromSuperlayer()
                }
            }
        }
    }
    
    public func rotate(duration: CFTimeInterval = 2) {
        if self.layer.animation(forKey: "rotationAnimation") == nil {
            let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.toValue = NSNumber(value: Double.pi * 2)
            rotation.duration = duration
            rotation.isCumulative = true
            rotation.repeatCount = Float.greatestFiniteMagnitude
            rotation.isRemovedOnCompletion = false
            self.layer.add(rotation, forKey: "rotationAnimation")
        }
    }
    
    public func removeRotate() {
        self.layer.removeAnimation(forKey: "rotationAnimation")
    }
    
}

extension UIView
{
    public func setIsEnabledAndAlpha(isEnabled: Bool, alpha: CGFloat = 0.5)
    {
        self.isUserInteractionEnabled = isEnabled
        self.alpha = isEnabled ? 1 : alpha
    }
    
    /// Get view's parent view controller
    public var parentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
