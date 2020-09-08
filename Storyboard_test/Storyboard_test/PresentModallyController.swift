import UIKit

class PresentModallyController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn2_click(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
