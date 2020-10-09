
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        if let VC1 = storyboard?.instantiateViewController(withIdentifier: "item1") {
            VC1.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(VC1, animated: true)
        }
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        
        if let VC2 = storyboard?.instantiateViewController(withIdentifier: "item2") {
            
            //VC2.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            VC2.modalTransitionStyle = UIModalTransitionStyle.partialCurl
            self.present(VC2, animated: true)
        }
    }
    
    @IBAction func btn3_click(_ sender: UIButton) {
        
        if let VC3 = storyboard?.instantiateViewController(withIdentifier: "item3") {
            
            VC3.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
            self.present(VC3, animated: true)
        }
    }
    
}

