import UIKit

class item1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purple
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        print("btn1_click")
    }
}

