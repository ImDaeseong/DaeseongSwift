
import UIKit
import SCLAlertView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        let appear = SCLAlertView.SCLAppearance(
            kCircleIconHeight: 40,
            showCloseButton: false,
            showCircularIcon: false,
            circleBackgroundColor: UIColor.gray,
            contentViewColor: UIColor.white,
            contentViewBorderColor: UIColor.red,
            titleColor: UIColor.brown
        )
        
        let icon = UIImage(named: "img1.png")
        
        let alert = SCLAlertView(appearance: appear)
        alert.addButton("cancel", backgroundColor: UIColor.orange, textColor: UIColor.white, showTimeout: nil){}
        alert.addButton("ok", backgroundColor: UIColor.orange, textColor: UIColor.white, showTimeout: nil){}
        alert.showCustom("제목", subTitle: "내용\n내용", color: UIColor.gray, icon: icon!)
        
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        
        let appear = SCLAlertView.SCLAppearance(
            showCloseButton:false,
            showCircularIcon:false,
            contentViewColor: UIColor.white,
            titleColor: UIColor.brown
        )
        
        let alert = SCLAlertView(appearance:appear)
        alert.addButton("cancel", backgroundColor: UIColor.orange, textColor: UIColor.white, showTimeout: nil){}
        alert.addButton("ok", backgroundColor: UIColor.orange, textColor: UIColor.white, showTimeout: nil){}
        alert.showInfo("제목", subTitle: "내용\n내용", closeButtonTitle: nil, timeout: nil)
    }
    
    @IBAction func btn3_click(_ sender: UIButton) {
       
        let appear = SCLAlertView.SCLAppearance(
            kWindowWidth: UIScreen.main.bounds.width * 0.75,
            kButtonHeight:50,
            showCloseButton:false,
            showCircularIcon:false,
            contentViewColor: UIColor.white,
            titleColor: UIColor.black,
            dynamicAnimatorActive : false,
            disableTapGesture: false
        )
        
        let icon = UIImage(named: "img1")
        
        let alert = SCLAlertView(appearance: appear)
        alert.addButton("ok", backgroundColor: UIColor.orange, textColor: UIColor.white, showTimeout: nil){}
        alert.showCustom("제목", subTitle: "내용\n내용", color: UIColor.orange, icon: icon!)
    }
    
}

