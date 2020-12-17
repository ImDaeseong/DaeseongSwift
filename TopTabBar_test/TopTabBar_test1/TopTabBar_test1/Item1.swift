import UIKit

class Item1: UIViewController {
    
    @IBOutlet weak var item1: UILabel!
    
    var tapGesture : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer))
        item1.isUserInteractionEnabled = true
        item1.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureRecognizer() {
       
        print("Item1")
    }
}
