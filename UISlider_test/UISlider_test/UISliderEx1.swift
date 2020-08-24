import UIKit

class UISliderEx1: UISlider {
    
    @IBInspectable var trackHeight : CGFloat = 1.0
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        
        let newBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: trackHeight))
        super.trackRect(forBounds: newBounds)
        return newBounds
    }
}
