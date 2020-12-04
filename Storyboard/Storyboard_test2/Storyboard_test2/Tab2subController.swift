import UIKit

class Tab2subController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        tabBarController?.selectedIndex = 0
    }
    
}
