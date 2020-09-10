import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view1 roundcorner
        view1.layer.cornerRadius = 8
        view1.layer.masksToBounds = true
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
}
