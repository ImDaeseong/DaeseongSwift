import UIKit

class Item2: UIViewController {
    
    @IBOutlet weak var item2: UILabel!
    
    var tapGesture : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer))
        item2.isUserInteractionEnabled = true
        item2.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureRecognizer() {
       
        print("Item2")
    }
}
