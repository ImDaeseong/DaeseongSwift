import UIKit

class UIViewEx6 : UIView {
    
    let gradient : CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        gradient.colors = [ UIColor.orange.cgColor, UIColor.white.cgColor ]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.locations = [0.0, 1.0]
        gradient.frame = bounds
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //크기 재조정
        gradient.frame = bounds
    }
}
