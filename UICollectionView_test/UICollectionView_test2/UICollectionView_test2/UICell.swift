import UIKit

class UICell: UICollectionViewCell {

    @IBOutlet weak var imgview1: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
}

struct cellItem : Hashable {
    
    let txtlabel : String
    let txtImage : String
    
    init(txtlabel : String, txtImage : String){
        
        self.txtlabel = txtlabel
        self.txtImage = txtImage
    }
}
