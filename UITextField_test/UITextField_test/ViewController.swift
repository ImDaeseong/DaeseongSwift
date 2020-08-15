
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
        
        print("btn1_click")
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        
        if let VC2 = storyboard?.instantiateViewController(withIdentifier: "item2") {
            
            //VC2.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
            //VC2.modalTransitionStyle = UIModalTransitionStyle.partialCurl
            //VC2.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            VC2.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(VC2, animated: true)
        }
        
        print("btn2_click")
        
    }
    
}

