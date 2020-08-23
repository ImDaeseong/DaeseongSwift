import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var stepper1: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = "0"
        
        //stepper1.translatesAutoresizingMaskIntoConstraints = false
        //stepper1.transform = CGAffineTransform(scaleX: 1.8, y: 1.0)
        
        stepper1.tintColor = UIColor.orange
        stepper1.value = 0
        stepper1.minimumValue = 0
        stepper1.maximumValue = 100
        stepper1.stepValue = 10
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stepper1_valuechanged(_ sender: UIStepper) {
        label1.text = "\(Int(stepper1.value))"
        print(Int(stepper1.value))
    }
}
