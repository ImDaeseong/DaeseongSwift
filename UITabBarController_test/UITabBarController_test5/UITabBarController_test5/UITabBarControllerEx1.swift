import UIKit

class UITabBarControllerEx1 : UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        //print(selectedIndex)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        //print(item.tag)
        //print(item.title!)
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        self.selectedIndex = tabBarController.selectedIndex
        
    }
    
}
