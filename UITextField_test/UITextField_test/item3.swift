import UIKit

class item3: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textfield1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.textfield1.delegate = self
        
        //텍스트 에디트에 포커스
        textfield1.becomeFirstResponder()
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //텍스트 입력 시작할때
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("텍스트 입력 시작할때")
    }
    
    //텍스트 입력 중일때
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("텍스트 입력 중일때 \(string)")
        return true
    }
    
    //리턴키 입력
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        print("리턴키 입력")
        return true
    }
    
    //텍스트 입력 종료
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        print("텍스트 입력 종료")
        return true
    }
}

