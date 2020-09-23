import UIKit

class UIViewEx1 : UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [ UIColor(red: 0.200, green: 0.200, blue: 0.200, alpha: 1).cgColor, UIColor(red: 0.200, green: 0.200, blue: 0.200, alpha: 0).cgColor ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
