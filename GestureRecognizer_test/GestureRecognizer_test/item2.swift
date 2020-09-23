import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var imageview1: UIImageView!
    
    var tapGesture : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer))
        imageview1.isUserInteractionEnabled = true
        imageview1.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureRecognizer() {
        label1.isHidden = !label1.isHidden
    }
}
