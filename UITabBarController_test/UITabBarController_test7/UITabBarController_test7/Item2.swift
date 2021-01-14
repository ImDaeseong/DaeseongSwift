import UIKit

class Item2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.green
    }
    
    @IBAction func btn_close(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
}
