
import UIKit

class UICollectionViewCellEx1 : UICollectionViewCell {
    
    @IBOutlet weak var imgview1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override var isSelected: Bool{
        didSet {
            
            self.layer.borderWidth = isSelected ? 1 : 0
            
            if isSelected{
                self.layer.borderColor = UIColor.orange.cgColor
            }else {
                self.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
}
