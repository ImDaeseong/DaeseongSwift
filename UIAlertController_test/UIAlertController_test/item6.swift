import UIKit

class item6: UIViewController {
    
    var alertController : UIAlertController!
    var alertCancel : UIAlertAction!
    var alertOK : UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btn1_click(_ sender: Any) {
        
        alertController = UIAlertController(title: "제목", message: "메시지", preferredStyle: .alert)
        
        weak var idField : UITextField!
        alertController.addTextField {(textField : UITextField!) in
            textField.placeholder = "id을 입력해 주세요."
            idField = textField
        }
        
        weak var passwordField : UITextField!
        alertController.addTextField {(textField : UITextField!) in
            textField.placeholder = "password을 입력해 주세요."
            textField.isSecureTextEntry = true
            passwordField = textField
        }
        
        alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertOK = UIAlertAction(title: "확인", style: .default, handler: { (UIAlertAction) in
            print(idField.text! + "\n" + passwordField.text!)
        })
        
        alertController.addAction(alertCancel)
        alertController.addAction(alertOK)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}
