
import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SVProgressHUD1()
        //SVProgressHUD2()
        //SVProgressHUD3()
        SVProgressHUD4()
    }
    
    func SVProgressHUD1(){
        
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            SVProgressHUD.dismiss()
        }
    }
    
    func SVProgressHUD2(){
        
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show(withStatus: "  로딩중....  ")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            SVProgressHUD.showError(withStatus: "error")
            SVProgressHUD.dismiss(withDelay: 1)
        }
    }
    
    func SVProgressHUD3(){
        
        SVProgressHUD.setForegroundColor(UIColor.orange)
        SVProgressHUD.setBorderColor(UIColor.orange)
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setBackgroundLayerColor(UIColor(white: 1, alpha: CGFloat(0.5)))
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            SVProgressHUD.showSuccess(withStatus: "success")
            SVProgressHUD.dismiss(withDelay: 1)
        }
    }
    
    func SVProgressHUD4(){
        
        SVProgressHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            SVProgressHUD.showInfo(withStatus: "info")
            SVProgressHUD.dismiss(withDelay: 1)
        }
    }
}
