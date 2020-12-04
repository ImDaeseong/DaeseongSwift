
import UIKit

class View1Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
