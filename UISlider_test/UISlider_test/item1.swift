
import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = ""
        
        slider1.minimumValue = 0
        slider1.maximumValue = 10
        slider1.value = 0
        slider1.minimumTrackTintColor = UIColor.lightGray
        slider1.maximumTrackTintColor = UIColor.darkGray
        slider1.thumbTintColor = UIColor.orange
        slider1.isContinuous = false //변경중 값 리턴 않함
    }
    
    @IBAction func slider1changed(_ sender: UISlider) {
        let value = String(format: "%.0f", sender.value)
        label1.text = "\(value)%"
    }
}
