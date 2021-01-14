import UIKit

class Item1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
    }
    
    @IBAction func btn_close(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
