
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper1: UIStepper!
    
    @IBOutlet weak var stepper2: BorderStepper!
    
    @IBOutlet weak var lbl1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper1.value = 0
        stepper1.minimumValue = 0
        stepper1.maximumValue = 100
        stepper1.stepValue = 1
        stepper1.tintColor = UIColor.orange
        
        stepper2.value = 0
        stepper2.minimumValue = 0
        stepper2.maximumValue = 100
        stepper2.stepValue = 2
        stepper2.tintColor = UIColor.lightGray
        
        
        lbl1.textColor = UIColor.red
        lbl1.text = "\(Int(stepper1!.value))"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        if ( stepper1.value < 10 ) {
            lbl1.textColor = UIColor.red
        } else if ( stepper1.value > 50 ) {
            lbl1.textColor = UIColor.green
        } else {
            lbl1.textColor = UIColor.gray
        }
        
        lbl1.text = "\(Int(stepper1!.value))"
        
    }
    
    
    @IBAction func stepper2ValueChanged(_ sender: BorderStepper) {
        
        if ( stepper2.value < 10 ) {
            lbl1.textColor = UIColor.red
        } else if ( stepper2.value > 50 ) {
            lbl1.textColor = UIColor.green
        } else {
            lbl1.textColor = UIColor.gray
        }
        
        lbl1.text = "\(Int(stepper2!.value))"
    }
    
}

