import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var segment1: UISegmentedControl!
    
    var itemName : [String] = ["제목 1", "제목 2", "제목 3", "제목 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment1.removeAllSegments()
        for i in 0 ..< itemName.count {
            segment1.insertSegment(withTitle: itemName[i], at: i, animated: true)
        }
        segment1.tintColor = UIColor.black
        segment1.backgroundColor = UIColor.white
        segment1.selectedSegmentIndex = 1
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segment1changed(_ sender: UISegmentedControl) {
        print(segment1.selectedSegmentIndex)
    }
}
