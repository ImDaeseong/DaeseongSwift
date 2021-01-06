
import UIKit

class tab1ViewController: UIViewController {

    let transition = SlideInTransition()
    
    var contentview : UIView!
    
    var swipeLeft : UISwipeGestureRecognizer!
    var swipeRight : UISwipeGestureRecognizer!
    var tapGesture : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initswipe()
        
        initTap()
        
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deleteswipe()
    }
    
    private func initswipe() {
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
    }
    
    private func deleteswipe(){
        
        transition.rightView.removeGestureRecognizer(tapGesture)
        
        self.view.removeGestureRecognizer(swipeLeft)
        self.view.removeGestureRecognizer(swipeRight)
    }
    
    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer){
        
        if sender.state == .ended {
            
            if sender.direction == .left {
                
                dismiss(animated: true, completion: nil)
                
            } else if sender.direction == .right {
                
                guard let MenuViewController = storyboard?.instantiateViewController(withIdentifier : "MenuViewController") as? MenuViewController  else { return }
                MenuViewController.selectedMenu = { MenuType in
                    self.callViewController(MenuType)
                }
                MenuViewController.modalPresentationStyle = .overCurrentContext
                MenuViewController.transitioningDelegate = self
                present(MenuViewController, animated: true, completion: nil)
            }
        }
    }
    
    private func initTap(){
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(TapGesture(_:)))
        transition.rightView.addGestureRecognizer(tapGesture)
        transition.rightView.isUserInteractionEnabled = true
    }
    
    @objc func TapGesture(_ sender: UITapGestureRecognizer){
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func menuItem_click(_ sender: UIBarButtonItem) {
        
        guard let MenuViewController = storyboard?.instantiateViewController(withIdentifier : "MenuViewController") as? MenuViewController  else { return }
        MenuViewController.selectedMenu = { MenuType in
            self.callViewController(MenuType)
        }
        MenuViewController.modalPresentationStyle = .overCurrentContext
        MenuViewController.transitioningDelegate = self
        present(MenuViewController, animated: true, completion: nil)
    }
    
    private func initView(){
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier : "homeViewController").view  else { return }
        vc.frame = self.view.bounds
        self.view.addSubview(vc)
        self.contentview = vc
    }
    
    private func callViewController(_ menuType : MenuType) {
        
        if contentview != nil {
            contentview.removeFromSuperview()
        }
        
        let title = String(describing : menuType).capitalized
        self.title = title
        
        switch menuType {
        case .tab1:
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier : "homeViewController").view  else { return }
            vc.frame = self.view.bounds
            self.view.addSubview(vc)
            self.contentview = vc
            break
            
        case .tab2:
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier : "tab2ViewController").view  else { return }
            vc.frame = self.view.bounds
            self.view.addSubview(vc)
            self.contentview = vc
            break
        case .tab3:
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier : "tab3ViewController").view  else { return }
            vc.frame = self.view.bounds
            self.view.addSubview(vc)
            self.contentview = vc
            break
            
        case .tab4:
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier : "tab4ViewController").view  else { return }
            vc.frame = self.view.bounds
            self.view.addSubview(vc)
            self.contentview = vc
            break
        }
    }
}

extension tab1ViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.isPresenting = false
        return transition
    }
}
