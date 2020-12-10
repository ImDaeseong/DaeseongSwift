import UIKit

class UITabBarControllerEx1 : UITabBarController, UITabBarControllerDelegate {
    
    let lbltitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InitTab()
        
        InitTabSwipeGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        InitTop()
    }
    
    func InitTop(){
        
        let topBar = UITabBar()
        topBar.barTintColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        lbltitle.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        lbltitle.text = "item1"
        
        topBar.addSubview(lbltitle)
        
        self.view.addSubview(topBar)
        
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        topBar.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true
        topBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        topBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        lbltitle.translatesAutoresizingMaskIntoConstraints = false
        lbltitle.leadingAnchor.constraint(equalTo: topBar.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        lbltitle.leadingAnchor.constraint(equalTo: topBar.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
        lbltitle.centerYAnchor.constraint(equalTo: topBar.layoutMarginsGuide.centerYAnchor).isActive = true
    }
    
    func InitTab(){
        
        self.title = "daeseong"
        self.tabBar.barTintColor = .white
        
        let item1 = Item1()
        item1.tabBarItem.image = UIImage(named: "1")?.withRenderingMode(.alwaysOriginal)
        item1.tabBarItem.selectedImage = UIImage(named: "1")?.withRenderingMode(.alwaysOriginal)
        item1.tabBarItem.tag = 0
        
        let item2 = Item2()
        item2.tabBarItem.image = UIImage(named: "1")?.withRenderingMode(.alwaysOriginal)
        item2.tabBarItem.selectedImage = UIImage(named: "1")?.withRenderingMode(.alwaysOriginal)
        item2.tabBarItem.tag = 1
        
        let item3 = Item3()
        item3.tabBarItem.image = UIImage(named: "1")?.withRenderingMode(.alwaysOriginal)
        item3.tabBarItem.selectedImage = UIImage(named: "1")?.withRenderingMode(.alwaysOriginal)
        item3.tabBarItem.tag = 2
        
        self.setViewControllers([item1, item2, item3], animated: true)
    }
    
    func InitTabSwipeGestureRecognizer(){
        
        self.delegate = self
        
        self.selectedIndex = 0
        
        let swipeGestueRight = UISwipeGestureRecognizer(target: self, action: #selector(TabBarSwipeGesture))
        swipeGestueRight.direction = .right
        self.view.addGestureRecognizer(swipeGestueRight)
        
        let swipeGestueLeft = UISwipeGestureRecognizer(target: self, action: #selector(TabBarSwipeGesture))
        swipeGestueLeft.direction = .left
        self.view.addGestureRecognizer(swipeGestueLeft)
    }
    
    @objc func TabBarSwipeGesture(_ sender:UISwipeGestureRecognizer)
    {
        if sender.direction == .left {
            if self.selectedIndex != 2 {
                self.selectedIndex += 1
            }else{
                self.selectedIndex = 0
            }
        }
        else if sender.direction == .right {
            if self.selectedIndex != 0 {
                self.selectedIndex -= 1
            }else{
                self.selectedIndex = 2
            }
        }
        
        switch selectedIndex {
        case 0:
            self.lbltitle.text = "item1"
            self.title = "daeseong"
        case 1:
            self.lbltitle.text = "item2"
            self.title = "daeseong"
        case 2:
            self.lbltitle.text = "item3"
            self.title = "daeseong"
        default:
            break
        }
        
        //print("UISwipeGestureRecognizer:\(selectedIndex)")
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
        case 0:
            self.lbltitle.text = "item1"
            self.title = "daeseong"
        case 1:
            self.lbltitle.text = "item2"
            self.title = "daeseong"
        case 2:
            self.lbltitle.text = "item3"
            self.title = "daeseong"
        default:
            break
        }
        
        //print("didSelect tag:\(item.tag)")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        self.selectedIndex = tabBarController.selectedIndex
    }
    
}

