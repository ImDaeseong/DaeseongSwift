import UIKit

class Item3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
    }
    
    @IBAction func btn_close(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_click(_ sender: Any) {
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "Item4") as? Item4
        self.navigationController?.pushViewController(VC!, animated: true)
    }
}
