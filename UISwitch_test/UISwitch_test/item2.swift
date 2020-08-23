import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var tv1: UITextView!
    
    @IBOutlet weak var switch1: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(tv1Tapped))
        tv1.addGestureRecognizer(tapGesture1)
        tv1.isUserInteractionEnabled = true
        
        
        switch1.tintColor = UIColor.gray //off
        switch1.onTintColor = UIColor.orange // on
        switch1.thumbTintColor = UIColor.gray  //off
        switch1.isOn = false
    }
    
    @objc func tv1Tapped() {
        
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func switch1_changed(_ sender: Any) {
        print(switch1.isOn)
    }
}
