import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var slider1: UISliderEx1!
    
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = ""
        
        slider1.minimumValue = 0
        slider1.maximumValue = 100
        slider1.value = 0
        slider1.minimumTrackTintColor = UIColor.black
        slider1.maximumTrackTintColor = UIColor.gray
        slider1.thumbTintColor = UIColor.orange
    }
    
    @IBAction func slider1changed(_ sender: UISliderEx1) {
        let value = String(Int(sender.value))
        label1.text = String(value) + " %"
    }
}
