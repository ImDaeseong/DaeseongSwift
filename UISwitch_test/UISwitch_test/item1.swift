import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var tv1: UITextView!
    
    @IBOutlet weak var switch1: UISwitch!
    
    @IBOutlet weak var switch2: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(tv1Tapped))
        tv1.addGestureRecognizer(tapGesture1)
        tv1.isUserInteractionEnabled = true
        
        //uiswitch1
        switch1.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        switch1.isOn = false
        
        //uiswitch2
        switch2.tintColor = UIColor.gray //off
        switch2.onTintColor = UIColor.orange // on
        switch2.backgroundColor = UIColor.gray  //off
        switch2.layer.cornerRadius = switch2.frame.height / 2
        switch2.isOn = false
    }
    
    @objc func tv1Tapped() {
        
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func switch1_changed(_ sender: Any) {
        print(switch1.isOn)
    }
    
    @IBAction func switch2_changed(_ sender: Any) {
        
        if switch2.isOn {
            self.view.backgroundColor = UIColor.gray
        } else{
            self.view.backgroundColor = UIColor.white
        }
    }
}
