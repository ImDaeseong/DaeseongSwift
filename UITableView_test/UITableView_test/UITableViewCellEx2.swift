import UIKit

protocol itemcell2Delegate : class {
    func selectCell(item : itemcell2)
}

class UITableViewCellEx2 : UITableViewCell {
    
    weak var delegate : itemcell2Delegate!
    
    @IBOutlet weak var imgview1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    var itemcell2 : itemcell2!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imgview1Tapped))
        imgview1.addGestureRecognizer(tapGesture)
        imgview1.isUserInteractionEnabled = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    @objc func imgview1Tapped(){
        delegate.selectCell(item: itemcell2)
    }
}
