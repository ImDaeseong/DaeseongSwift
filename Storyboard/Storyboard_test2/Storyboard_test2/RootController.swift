import UIKit

class RootController: UITabBarController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initTab()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initTab() {
        
        let tab1 = UIStoryboard.init(name: "Tab1", bundle: nil).instantiateViewController(withIdentifier: "Tab1Detail")
        let item1 : UITabBarItem = UITabBarItem(title: "tab1", image: UIImage(named: "1"), selectedImage: UIImage(named: "2"))
        tab1.tabBarItem = item1
        
        let tab2 = UIStoryboard.init(name: "Tab2", bundle: nil).instantiateViewController(withIdentifier: "Tab2Detail")
        let item2 : UITabBarItem = UITabBarItem(title: "tab2", image: UIImage(named: "1"), selectedImage: UIImage(named: "2"))
        tab2.tabBarItem = item2
        
        let tab3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "maindetail")
        let item3 : UITabBarItem = UITabBarItem(title: "main", image: UIImage(named: "1"), selectedImage: UIImage(named: "2"))
        tab3.tabBarItem = item3
        
        self.viewControllers = [tab1, tab2, tab3]
    }
    
}
