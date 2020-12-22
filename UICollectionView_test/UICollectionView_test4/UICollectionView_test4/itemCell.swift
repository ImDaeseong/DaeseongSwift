
import UIKit

class itemCell: UICollectionViewCell {

    @IBOutlet weak var imgview1: UIImageView!
    
    static let identifier = "itemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with image : UIImage){
        
        imgview1.image = image
    }
    
    static func nib() -> UINib {
        
        return UINib(nibName: "itemCell", bundle: nil)
    }
}
