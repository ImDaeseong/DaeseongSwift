import UIKit

class item4: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var segment1: UISegmentedControl!
    
    var itemName = [UIImage(named: "img1.png"), UIImage(named: "img2.png"), UIImage(named: "img3.png"), UIImage(named: "img4.png")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        segment1.removeAllSegments()
        for i in 0 ..< itemName.count {
            segment1.insertSegment(with: itemName[i], at: i, animated: true)
        }
        segment1.translatesAutoresizingMaskIntoConstraints = false
        segment1.tintColor = UIColor.black
        segment1.backgroundColor = UIColor.white
        segment1.selectedSegmentIndex = 0
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segment1changed(_ sender: UISegmentedControl) {
        print(segment1.selectedSegmentIndex)
    }
}
