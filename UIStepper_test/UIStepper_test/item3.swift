import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var stepper1: UIStepperEx1!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = "0"
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepper1_valuechanged(_ sender: UIStepperEx1) {
        label1.text = "\(Int(stepper1.value))"
    }
}
