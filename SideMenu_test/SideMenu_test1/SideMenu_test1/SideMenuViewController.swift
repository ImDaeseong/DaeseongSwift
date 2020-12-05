
import UIKit
import SideMenuSwift

class SideMenuViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        let width: CGFloat = (UIScreen.main.bounds.width )
        
        // 사이드 메뉴 폭
        SideMenuController.preferences.basic.menuWidth = width * 0.9
        SideMenuController.preferences.basic.defaultCacheKey = "0"
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        
        sideMenuController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        //닫기
        sideMenuController?.hideMenu()
    }
    
    @IBAction func btn2_click(_ sender: Any) {
        
        if let VC = storyboard?.instantiateViewController(withIdentifier: "IntroViewController") {
            
            self.present(VC, animated: true, completion: nil)
            sideMenuController?.hideMenu()
        }
    }
    
    @IBAction func btn3_click(_ sender: Any) {
        
        let VC = UIStoryboard.init(name: "First", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController")
        self.present(VC, animated: true, completion: nil)
        sideMenuController?.hideMenu()
    }
    
    @IBAction func btn4_click(_ sender: Any) {
        
        let VC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IntroViewController")
        self.present(VC, animated: true, completion: nil)
        sideMenuController?.hideMenu()
    }
}

extension SideMenuViewController : SideMenuControllerDelegate {
    
    func sideMenuController(_ sideMenuController: SideMenuController, animationControllerFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return BasicTransitionAnimator(options: .transitionFlipFromLeft, duration: 0.6)
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, willShow viewController: UIViewController, animated: Bool) {
        
        print("sideMenuController willShow [\(viewController)]")
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, didShow viewController: UIViewController, animated: Bool) {
        
        print("sideMenuController didShow [\(viewController)]")
    }
    
    func sideMenuWillHide(_ sideMenu: SideMenuController) {
        
        print("sideMenuWillHide")
    }
    
    func sideMenuDidHide(_ sideMenu: SideMenuController) {
        
        print("sideMenuDidHide")
    }
    
    func sideMenuWillReveal(_ sideMenu: SideMenuController) {
        
        print("sideMenuWillReveal")
    }
    
    func sideMenuDidReveal(_ sideMenu: SideMenuController) {
        
        print("sideMenuDidReveal")
    }
}
