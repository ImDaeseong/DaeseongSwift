import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    var alertController : UIAlertController!
    var alertCancel : UIAlertAction!
    var alertOk : UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        alertController = UIAlertController(title: "제목", message: "메시지", preferredStyle: .alert)
        
        alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: { (UIAlertAction) in
            self.alertController.dismiss(animated: true, completion: nil)
        })
        
        alertOk = UIAlertAction(title: "확인", style: .default, handler: { (UIAlertAction) in
            self.alertController.dismiss(animated: true, completion: nil)
        })
        
        alertController.addAction(alertCancel)
        alertController.addAction(alertOk)
        
        alertController.view.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        alertController.view.tintColor = UIColor.orange
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func btn2_click(_ sender: Any) {
        
        alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        
        let titleFont = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), .foregroundColor : UIColor.orange, .backgroundColor : UIColor.gray]
        let messageFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), .foregroundColor : UIColor.gray, .backgroundColor : UIColor.blue]
        
        let titleString = NSMutableAttributedString(string: "제목", attributes: titleFont)
        let messageString = NSMutableAttributedString(string: "메시지 내용", attributes: messageFont)
        
        //제목, 내용 색상
        alertController.setValue(titleString, forKey: "attributedTitle")
        alertController.setValue(messageString, forKey: "attributedMessage")
        
        //취소버튼 색상
        alertCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertCancel.setValue(UIColor.red, forKey: "titleTextColor")
        
        //확인버튼 색상
        alertOk = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertOk.setValue(UIColor.black, forKey: "titleTextColor")
        
        alertController.addAction(alertCancel)
        alertController.addAction(alertOk)
        
        //let VC = UIViewController()
        //VC.view.backgroundColor = UIColor.blue
        //alertController.setValue(VC, forKey: "contentViewController")
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
