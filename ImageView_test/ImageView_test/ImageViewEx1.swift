import UIKit

class ImageViewEx1 : UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
