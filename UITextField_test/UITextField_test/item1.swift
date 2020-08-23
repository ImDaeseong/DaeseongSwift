import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var imgview1: UIImageView!
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var textfield2: UITextField!
    
    @IBOutlet weak var textfield3: UITextField!
    
    @IBOutlet weak var textfield4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imgview1_Tapped))
        imgview1.addGestureRecognizer(tapGesture1)
        imgview1.isUserInteractionEnabled = true
    }
    
    @objc func imgview1_Tapped(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
