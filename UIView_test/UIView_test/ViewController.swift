
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view7: UIViewEx7!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(callFlip), userInfo : nil, repeats: true)
    }
    
    @objc func callFlip(){
        view7.flip()
    }
}

