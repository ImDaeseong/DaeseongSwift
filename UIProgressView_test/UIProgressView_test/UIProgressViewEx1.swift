import UIKit

class UIProgressViewEx1 : UIProgressView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bezier = UIBezierPath(roundedRect: bounds, cornerRadius: 10.0)
        let slayer = CAShapeLayer()
        slayer.frame = self.bounds
        slayer.path = bezier.cgPath
        self.layer.mask = slayer
    }
}
