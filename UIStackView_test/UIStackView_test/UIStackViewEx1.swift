import UIKit

class UIStackViewEx1 : UIStackView {
    
    var label1 = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        addBackground()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addBackground() {
        
        let img1 = UIImageView(frame: UIScreen.main.bounds)
        img1.image = UIImage(named: "img1")
        img1.contentMode = .scaleToFill
        img1.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(img1)
        sendSubviewToBack(img1)
        
        let leading = NSLayoutConstraint(item: img1, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 0.0)
        
        let trailing = NSLayoutConstraint(item: img1, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: 0.0)
        
        let top = NSLayoutConstraint(item: img1, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0.0)
        
        let bottom = NSLayoutConstraint(item: img1, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0.0)
        
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
    }
    
}
