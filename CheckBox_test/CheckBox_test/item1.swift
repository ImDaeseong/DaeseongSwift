import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var btn2: CheckBoxEx1!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn2.isSelected = true
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn2_click(_ sender: CheckBoxEx1) {
        
        print(sender.isSelected)
    }
}
