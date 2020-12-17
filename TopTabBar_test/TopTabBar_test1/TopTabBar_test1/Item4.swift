import UIKit

class Item4: UIViewController {
    
    @IBOutlet weak var item4: UILabel!
    
    var tapGesture : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer))
        item4.isUserInteractionEnabled = true
        item4.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureRecognizer() {
       
        print("Item4")
    }
}
