import UIKit

class Item3: UIViewController {
    
    @IBOutlet weak var item3: UILabel!
    
    var tapGesture : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer))
        item3.isUserInteractionEnabled = true
        item3.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureRecognizer() {
       
        print("Item3")
    }
}
