import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var segment1: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment1.translatesAutoresizingMaskIntoConstraints = false
        segment1.tintColor = UIColor.black
        segment1.backgroundColor = UIColor.white
        segment1.layer.cornerRadius = 5
        segment1.layer.shadowColor = UIColor.gray.cgColor
        segment1.layer.shadowOffset = CGSize(width: 5, height: 5)
        segment1.layer.shadowOpacity = 0.5
        segment1.selectedSegmentIndex = 1
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segment1changed(_ sender: UISegmentedControl) {
        print(segment1.selectedSegmentIndex)
    }
}
