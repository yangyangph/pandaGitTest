import UIKit

public enum GradientDirections: Int
{
    case LeftToRight
    case RightToLeft
    case TopToBottom
    case BottomToTop
    case TopLeftToBottomRight
    case TopRightToBottomLeft
    case BottomLeftToTopRight
    case BottomRightToTopLeft
}

extension CAGradientLayer
{
    /// 渐变图层
    public func gradientLayer(startColor: UIColor, endColor: UIColor, direction: GradientDirections) -> CAGradientLayer
    {
        
        let gradientColors = [startColor.cgColor, endColor.cgColor]
        
        self.colors = gradientColors
        
        switch direction
        {
        case .TopToBottom:
            self.startPoint = CGPoint(x: 0.5, y: 0)
            self.endPoint = CGPoint(x: 0.5, y: 1)
            
        case .BottomToTop:
            self.startPoint = CGPoint(x: 0.5, y: 1)
            self.endPoint = CGPoint(x: 0.5, y: 0)
            
        case .LeftToRight:
            self.startPoint = CGPoint(x: 0, y: 0.5)
            self.endPoint = CGPoint(x: 1, y: 0.5)
            
        case .RightToLeft:
            self.startPoint = CGPoint(x: 1, y: 0.5)
            self.endPoint = CGPoint(x: 0, y: 0.5)
            
        case .TopLeftToBottomRight:
            self.startPoint = CGPoint(x: 0, y: 0)
            self.endPoint = CGPoint(x: 1, y: 1)
            
        case .TopRightToBottomLeft:
            self.startPoint = CGPoint(x: 1, y: 0)
            self.endPoint = CGPoint(x: 0, y: 1)
            
        case .BottomLeftToTopRight:
            self.startPoint = CGPoint(x: 0, y: 1)
            self.endPoint = CGPoint(x: 1, y: 0)
            
        case .BottomRightToTopLeft:
            self.startPoint = CGPoint(x: 1, y: 1)
            self.endPoint = CGPoint(x: 0, y: 0)
        }
        
        return self
    }
}
