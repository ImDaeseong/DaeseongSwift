
import UIKit

@IBDesignable
class colorSwitch: UISwitch {

    @IBInspectable var OffTint : UIColor? {
        didSet {
            self.tintColor = OffTint
            //self.layer.cornerRadius = self.bounds.height / 2 // 16
            //self.backgroundColor = OffTint
        }
    }
    
    @IBInspectable var OnTint : UIColor? {
        didSet {
            self.onTintColor = OnTint
            //self.layer.cornerRadius = self.bounds.height / 2 // 16
            //self.backgroundColor = OnTint
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 2
    }
    
    override func setOn(_ on: Bool, animated: Bool) {
        super.setOn(on, animated: true)
        updateColor()
    }

    func updateColor() {
        if self.isOn == true {
            self.backgroundColor = self.OnTint
        } else {
            self.backgroundColor = self.OffTint
        }
    }

}
