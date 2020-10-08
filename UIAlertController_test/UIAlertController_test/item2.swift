import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    var alertController : UIAlertController!
    var alertCancel : UIAlertAction!
    var alertOk : UIAlertAction!
    var alertDelete : UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        alertController = UIAlertController(title: "제목", message: "메시지", preferredStyle: .actionSheet)
        
        alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: { (UIAlertAction) in
            print("cancel")
        })
        
        alertOk = UIAlertAction(title: "확인", style: .default, handler: { (UIAlertAction) in
            print("ok")
        })
        
        alertDelete = UIAlertAction(title: "삭제", style: .destructive, handler: { (UIAlertAction) in
            print("delete")
        })
        
        alertController.addAction(alertCancel)
        alertController.addAction(alertOk)
        alertController.addAction(alertDelete)
        //alertController.view.tintColor = UIColor.orange
        self.present(alertController, animated: true, completion: nil)
    }
}
