import UIKit
import FlexLayout
import PinLayout

class View4Controller: UIViewController {

    private let flexview = ViewEx1()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flexview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(flexview)
        
        NSLayoutConstraint.activate([
            flexview.topAnchor.constraint(equalTo: view.topAnchor),
            flexview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            flexview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
