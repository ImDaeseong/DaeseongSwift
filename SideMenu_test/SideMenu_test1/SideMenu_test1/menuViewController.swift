
import UIKit

protocol MenuViewControllerDelegate {
    func didselectedMenu(named : MenuType)
}

enum MenuType : String, CaseIterable {
    case tab1 = "tab1_menu"
    case tab2 = "tab2_menu"
    case tab3 = "tab3_menu"
}

class menuViewController: UIViewController {

    public var delegate : MenuViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func menu1_click(_ sender: Any) {
        
        delegate?.didselectedMenu(named: .tab1)
    }
    
    @IBAction func menu2_click(_ sender: Any) {
        
        delegate?.didselectedMenu(named: .tab2)
    }
    
    @IBAction func menu3_click(_ sender: Any) {
        
        delegate?.didselectedMenu(named: .tab3)
    }
}
