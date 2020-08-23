import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var segment1: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment1.tintColor = UIColor.orange
        segment1.backgroundColor = UIColor.white
        segment1.selectedSegmentIndex = 0
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segment1changed(_ sender: UISegmentedControl) {
        
        switch segment1.selectedSegmentIndex {
        case 0:
            print(segment1.selectedSegmentIndex)
        case 1:
            print(segment1.selectedSegmentIndex)
        default:
            break
        }
    }
}
