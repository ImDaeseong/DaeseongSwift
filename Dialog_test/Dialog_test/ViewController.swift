
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_clikc(_ sender: Any) {
        
        if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "item1") {
            
            dvc.modalPresentationStyle = .overCurrentContext
            self.present(dvc, animated: false, completion: nil)
        }
        
    }
}

