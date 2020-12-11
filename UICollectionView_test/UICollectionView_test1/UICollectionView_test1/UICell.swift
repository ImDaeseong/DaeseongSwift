
import UIKit

class UICell: UICollectionViewCell {

    @IBOutlet weak var imgview: UIImageView!
    
    @IBOutlet weak var label: UILabel!
}


struct cellItem : Hashable {
    
    let txtlabel : String
    let txtImage : String
    
    init(txtlabel : String, txtImage : String){
        
        self.txtlabel = txtlabel
        self.txtImage = txtImage
    }
}
