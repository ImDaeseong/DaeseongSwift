import UIKit

class item5: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    var alertController : UIAlertController!
    var alertCancel : UIAlertAction!
    var alertCheck : UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        alertController = UIAlertController(title: "제목", message: "메시지", preferredStyle: .alert)
        
        weak var alertTextField : UITextField!
        alertController.addTextField {(textField : UITextField!) in
            textField.placeholder = "값을 입력해 주세요."
            textField.textColor = UIColor.orange
            
            //textField 입력값을 alertTextField 에 입력
            alertTextField = textField
            
            //label1 입력값을 textField 에 입력
            textField.text = self.label1.text
        }
        
        alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertCheck = UIAlertAction(title: "입력값 체크", style: .default, handler: { (UIAlertAction) in
            let msg = self.alertController.textFields?.first!
            print(msg?.text!)
        })
        
        alertController.addAction(alertCancel)
        alertController.addAction(alertCheck)
        alertController.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { _ in
            
            if let text = alertTextField?.text{
                self.label1.text = text
            }
        })
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}
