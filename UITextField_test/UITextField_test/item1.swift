import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var imgview1: UIImageView!
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var textfield2: UITextField!
    
    @IBOutlet weak var textfield3: UITextField!
    
    @IBOutlet weak var textfield4: UITextField!
    
    var keyboardheight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imgview1_Tapped))
        imgview1.addGestureRecognizer(tapGesture1)
        imgview1.isUserInteractionEnabled = true
        
        //키보드 보임/숨김 여부 감시
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        //텍스트 에디트에 포커스
        textfield1.becomeFirstResponder()
    }
    
    @objc func keyboardWillAppear(_ sender : NotificationCenter){
        
        //print("keyboard 보임")
        
        if (keyboardheight != 0) {
            self.view.frame.origin.y -= 200
            self.keyboardheight += 200
        }
    }

    @objc func keyboardWillDisappear(_ sender : NotificationCenter){
        
        //print("keyboard 숨김")
        
        self.view.frame.origin.y += CGFloat(self.keyboardheight)
        self.keyboardheight = 0
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //print("touchesBegan 터치 이벤트 키보드 숨김")
        
        self.view.endEditing(true)
        self.view.frame.origin.y += CGFloat(self.keyboardheight)
        self.keyboardheight = 0
    }
    
    @objc func imgview1_Tapped(_ sender: UITapGestureRecognizer) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
