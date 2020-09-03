
import UIKit

class UITabBarControllerEx1 : UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tabBar.frame = CGRect(x: 0, y: 20, width: tabBar.frame.size.width, height: tabBar.frame.size.height - 10)
    }
}
