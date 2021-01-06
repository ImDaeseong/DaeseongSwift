
import UIKit

enum MenuType : Int {
    case tab1
    case tab2
    case tab3
    case tab4
}

class MenuViewController: UITableViewController {

    var swipeLeft : UISwipeGestureRecognizer!
    
    var selectedMenu : ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inittableView()
        
        initswipe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.removeGestureRecognizer(swipeLeft)
    }
    
    private func initswipe() {
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer){
        
        if sender.state == .ended {
            
            if sender.direction == .left {
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    private func inittableView() {
        
        self.tableView.isScrollEnabled = false
        self.tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        
        dismiss(animated: true) { [weak self] in
            self?.selectedMenu?(menuType)
        }
    }
    
    //상단 공간
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    //하단 공간
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
}

