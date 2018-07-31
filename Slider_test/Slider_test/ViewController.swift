
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var slider2: BorderRectSlider!
    
    @IBOutlet weak var lbl1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider1.minimumValue = 0
        slider1.maximumValue = 10
        slider1.value = 0
        slider1.isContinuous = false //변경중 값 리턴 않함
        slider1.minimumTrackTintColor = UIColor.blue
        slider1.maximumTrackTintColor = UIColor.red
        slider1.thumbTintColor = UIColor.purple
        
        
        slider2.minimumValue = 0
        slider2.maximumValue = 10
        slider2.value = 10
        slider2.isContinuous = true // 변경중 값 리턴
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        let sliderValue = lroundf(sender.value)
        lbl1.text = "\(sliderValue)"
    }
    
    
    @IBAction func slider2ValueChanged(_ sender: BorderRectSlider) {
        
        let sliderValue = lroundf(sender.value)
        lbl1.text = "\(sliderValue)"
    }
    
}

