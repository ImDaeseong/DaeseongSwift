
import UIKit

//@IBDesignable
class BorderSegmentedControl: UISegmentedControl {

    override func awakeFromNib() {
        
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.backgroundColor = UIColor(displayP3Red: 125, green: 125, blue: 125, alpha: 0.6)
        self.tintColor = UIColor.brown
    }

}
