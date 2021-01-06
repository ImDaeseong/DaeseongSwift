
import UIKit
import SideMenu

class ViewController: UIViewController {

    var sideMenu : SideMenuNavigationController!
    
    var swipeRight : UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initsideMenu()
        
        initswipe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.removeGestureRecognizer(swipeRight)
    }
    
    private func initswipe(){
        
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer){
        
        if sender.state == .ended {
            
            if sender.direction == .right {
                present(sideMenu, animated: true)
            }
        }
    }
    
    private func initsideMenu(){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "menuViewController") as! menuViewController
        
        sideMenu = SideMenuNavigationController(rootViewController: vc)
        sideMenu.statusBarEndAlpha = 0
        sideMenu.dismissOnPresent = true
        sideMenu.dismissOnPush = true
        sideMenu.enableTapToDismissGesture = true
        sideMenu.enableSwipeToDismissGesture = true
        sideMenu.enableSwipeToDismissGesture = true
        sideMenu.sideMenuDelegate = self
        sideMenu.menuWidth = self.view.bounds.width * 0.8
        sideMenu.presentationStyle = .menuSlideIn //이게 없으면 메뉴 버튼 오른쪽을 밀려남
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.leftMenuNavigationController?.setNavigationBarHidden(true, animated: true)//상단 상태바 숨김
    }
    
    @IBAction func menu_click(_ sender: UIBarButtonItem) {
        
        present(sideMenu, animated: true)
    }
    
    @IBAction func unwindToVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        print(sourceViewController)
    }
}

extension ViewController: SideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        //print("sideMenuWillAppear")
    }

    func sideMenuDidAppear(menu: SideMenuNavigationController, animated: Bool) {
        //print("sideMenuDidAppear")
    }

    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        //print("sideMenuWillDisappear")
    }

    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
        //print("sideMenuDidDisappear")
    }
}
