import UIKit

class ImageViewEx3 : UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear

        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor]
        gradient.locations = [0.0, 0.5]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
