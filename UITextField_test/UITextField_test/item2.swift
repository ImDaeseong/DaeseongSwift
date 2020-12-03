import UIKit

class item2: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var view1: UIView!
    
    var keyboardheight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view1.backgroundColor = UIColor.red.withAlphaComponent(0.55)
        self.view1.layer.cornerRadius = 5
        self.view1.layer.borderWidth = 1.5
        self.view1.layer.borderColor = UIColor.orange.cgColor
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view1.addGestureRecognizer(tap1)
        
        
        //텍스트 에디트 설정
        self.textfield1.placeholder = "값을 입력하세요"
        self.textfield1.tintColor = UIColor.white
        self.textfield1.textColor = UIColor.orange
        self.textfield1.backgroundColor = UIColor.lightGray
        self.textfield1.borderStyle = .line
        self.textfield1.layer.borderColor = UIColor.orange.cgColor
        self.textfield1.layer.borderWidth = 1.0
        self.textfield1.contentHorizontalAlignment = .center
        self.textfield1.contentVerticalAlignment = .center
        
        self.textfield1.delegate = self
        
        
        //키보드 보임/숨김 여부 감시
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //print("keyboard 보임")
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //print("textFieldShouldReturn 리턴키 입력시 키보드 숨김")
        
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //print("touchesBegan 터치 이벤트 키보드 숨김")
        
        self.view.endEditing(true)
        self.view.frame.origin.y += CGFloat(self.keyboardheight)
        self.keyboardheight = 0
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
