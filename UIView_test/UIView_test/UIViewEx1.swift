import UIKit

class UIViewEx1 : UIView {
    
    let gradient : CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        gradient.colors = [ UIColor(red: 0.200, green: 0.200, blue: 0.200, alpha: 1).cgColor, UIColor(red: 0.200, green: 0.200, blue: 0.200, alpha: 0).cgColor ]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.cornerRadius = 5
        gradient.frame = bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //크기 재조정
        gradient.frame = bounds
    }
}
