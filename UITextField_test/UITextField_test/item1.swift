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
        
        //텍스트 에디트에 포커스
        textfield1.becomeFirstResponder()
    }
    
    @objc func imgview1_Tapped(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //터치시 키보드 내리기
        textfield1.resignFirstResponder()
        textfield2.resignFirstResponder()
        textfield3.resignFirstResponder()
        textfield4.resignFirstResponder()
    }
}
