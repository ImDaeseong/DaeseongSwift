
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadview()
    }
    
    private func loadview(){
        let v1 = viewxib1()
        v1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v1)
        v1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        v1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        v1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        v1.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
}

