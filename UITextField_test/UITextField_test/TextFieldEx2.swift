import UIKit

class TextFieldEx2: UITextField {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let border = CALayer()
        let linewidth = CGFloat(0.5)
        
        border.borderColor = UIColor.orange.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - linewidth, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = linewidth
        
        self.layer.addSublayer(border)
        self.borderStyle = .none
        self.textColor = UIColor.orange
        self.textAlignment = .center
        self.layer.masksToBounds = true
        
    }
    
}
