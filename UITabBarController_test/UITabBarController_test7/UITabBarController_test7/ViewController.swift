
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "Item1") as? Item1
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    
    @IBAction func btn2_click(_ sender: Any) {
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "Item2") as? Item2
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    
    @IBAction func btn3_click(_ sender: Any) {
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "Item3") as? Item3
        self.navigationController?.pushViewController(VC!, animated: true)
    }
}

