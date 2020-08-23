import UIKit

class TextFieldEx1: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.textColor = UIColor.orange
        self.textAlignment = .left//.center
        self.backgroundColor = UIColor.clear //UIColor(red: 250.0/255, green: 250.0/255, blue: 250.0/255, alpha: 1.0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.layer.backgroundColor = UIColor(red: 250.0/255, green: 250.0/255, blue: 250.0/255, alpha: 1.0).cgColor
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1.0
    }
}
