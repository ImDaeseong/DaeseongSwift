import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = ""
        
        slider1.minimumValue = 0
        slider1.maximumValue = 10
        slider1.value = 0
        slider1.minimumTrackTintColor = UIColor.black
        slider1.maximumTrackTintColor = UIColor.gray
        slider1.thumbTintColor = UIColor.orange
        slider1.isContinuous = true // 변경중 값 리턴
        slider1.backgroundColor = UIColor.white
        slider1.layer.cornerRadius = 10
        slider1.layer.shadowOpacity = 0.5
        slider1.layer.masksToBounds = false
    }
    
    @IBAction func slider1changed(_ sender: UISlider) {
        let value = Int(sender.value)
        label1.text = String(value) + " %"
    }
}
