
import UIKit

class Item1: UIViewController {

    @IBOutlet weak var roundview: RoundView!
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundview.percent = 0
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        slider.minimumTrackTintColor = UIColor.black
        slider.maximumTrackTintColor = UIColor.gray
        slider.thumbTintColor = UIColor.orange
    }
    
    @IBAction func sliderchanged(_ sender: UISlider) {
        
        let val : Int = Int(sender.value)
        roundview.percent = val
    }
}

