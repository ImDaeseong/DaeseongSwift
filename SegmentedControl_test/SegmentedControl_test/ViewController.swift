
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seg1: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func seg1(_ sender: UISegmentedControl) {
    
        switch seg1.selectedSegmentIndex {
        case 0:
            print("1")
            break
        case 1:
            print("2")
            break
        case 2:
            print("3")
            break
        default:
            print("default")
            break
        }
    }
    
}

