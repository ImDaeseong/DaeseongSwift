
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containview1: UIView!
    @IBOutlet weak var containview2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initview()
    }
    
    private func initview(){
        
        let height : CGFloat = (self.view.frame.height / 2)
          
        containview1.translatesAutoresizingMaskIntoConstraints = false
        //containview1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        containview1.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containview1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containview1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containview1.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        containview2.translatesAutoresizingMaskIntoConstraints = false
        containview2.topAnchor.constraint(equalTo: containview1.bottomAnchor).isActive = true
        containview2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containview2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //containview2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        containview2.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containview2.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

