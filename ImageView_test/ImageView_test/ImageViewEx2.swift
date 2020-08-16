import UIKit

class ImageViewEx2 : UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
        self.backgroundColor = UIColor.clear
        
    }
}
