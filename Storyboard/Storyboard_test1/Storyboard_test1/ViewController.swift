
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btn1_click(_ sender: Any) {
        
        let Board: UIStoryboard = UIStoryboard.init(name: "First", bundle: nil)
        
        let VC = Board.instantiateViewController(withIdentifier: "First")
        
        self.present(VC, animated: true)
    }

    @IBAction func btn2_click(_ sender: Any) {
        
        let Board: UIStoryboard = UIStoryboard.init(name: "End", bundle: nil)
        
        let VC = Board.instantiateViewController(withIdentifier: "MainTab")
        
        self.present(VC, animated: true)
    }
    
    @IBAction func btn3_click(_ sender: Any) {
        
        if let VC = storyboard?.instantiateViewController(withIdentifier: "view1") {
            self.present(VC, animated: true)
        }
    }
    
    @IBAction func btn4_click(_ sender: Any) {
        
        let Board: UIStoryboard = UIStoryboard.init(name: "Second", bundle: nil)
        
        let VC = Board.instantiateViewController(withIdentifier: "Navi")
        
        self.present(VC, animated: true)
    }
}

