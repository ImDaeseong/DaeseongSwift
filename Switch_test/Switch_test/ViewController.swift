
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switch1: UISwitch!
    
    @IBOutlet weak var switch2: UISwitch!
    
    @IBOutlet weak var switch3: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch1.tintColor = UIColor.gray //off
        switch1.onTintColor = UIColor.orange // on
        switch1.backgroundColor = UIColor.gray  //off
        switch1.layer.cornerRadius = switch1.frame.height / 2
        switch1.isOn = true
        
        
        switch2.isOn = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switch1ValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("on")
        } else {
            print("off")
        }        
    }
    
    @IBAction func switch2ValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("on")
        } else {
            print("off")
        }
    }
    
    @IBAction func switch3ValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("on")
        } else {
            print("off")
        }
    }
    
}

