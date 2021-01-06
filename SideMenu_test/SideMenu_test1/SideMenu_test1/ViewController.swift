
import UIKit
import SideMenu

class ViewController: UIViewController {

    @IBOutlet weak var contentview: UIView!
    
    var sideMenu : SideMenuNavigationController!
    
    var swipeRight : UISwipeGestureRecognizer!
    
    lazy var tab1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tab1ViewController")
    lazy var tab2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tab2ViewController")
    lazy var tab3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tab3ViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initsideMenu()
        
        initswipe()
        
        addViews()
    }
    
    private func initsideMenu() {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "menuViewController") as! menuViewController
        vc.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: vc)
        sideMenu.leftSide = true
        sideMenu.sideMenuDelegate = self
        sideMenu.menuWidth = self.view.bounds.width * 0.8
        sideMenu.presentationStyle = .menuSlideIn //이게 없으면 메뉴 버튼 오른쪽을 밀려남
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.leftMenuNavigationController?.setNavigationBarHidden(true, animated: true)//상단 상태바 숨김
    }
    
    private func initswipe() {
        
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
    
    private func addViews() {
        
        self.addChild(tab1)
        tab1.view.frame = contentview.bounds
        self.contentview.addSubview(tab1.view)
        
        self.addChild(tab2)
        tab2.view.frame = contentview.bounds
        self.contentview.addSubview(tab2.view)
        
        self.addChild(tab3)
        tab3.view.frame = contentview.bounds
        self.contentview.addSubview(tab3.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @IBAction func menu_click(_ sender: UIBarButtonItem) {
        
        present(sideMenu, animated: true)
    }
    
    @IBAction func unwindToVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        print(sourceViewController)
    }
}

extension ViewController : MenuViewControllerDelegate {
    
    func didselectedMenu(named : MenuType){
        
        sideMenu.dismiss(animated: true, completion: nil)
        //print(named.rawValue)
        
        switch named {
        case .tab1:
            self.contentview.bringSubviewToFront(tab1.view)
            break
            
        case .tab2:
            self.contentview.bringSubviewToFront(tab2.view)
            break
            
        case .tab3:
            self.contentview.bringSubviewToFront(tab3.view)
            break
        }
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
