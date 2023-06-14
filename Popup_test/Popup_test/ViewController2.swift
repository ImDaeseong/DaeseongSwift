import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    var popup : PopupView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popup = PopupView()
    }
    
    //사이즈 변경시 반영
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonroundCornersBorder(button: button1)
    }

    @IBAction func button1_Click(_ sender: Any) {
        
        if popup.isDescendant(of: view) {
            
            self.popup.removeFromSuperview()
            
        } else {
            
            self.popup.buttonAction = { (isValue) in
                print(isValue)
            }
            
            DispatchQueue.main.async {
                self.view.addSubview(self.popup)
                self.popup.leadingAnchor.constraint(equalTo: self.button1.leadingAnchor).isActive = true
                self.popup.topAnchor.constraint(equalTo: self.button1.bottomAnchor, constant: 4).isActive = true
                
                self.popup.translatesAutoresizingMaskIntoConstraints = false
                self.popup.heightAnchor.constraint(equalToConstant: 71).isActive = true
                self.popup.widthAnchor.constraint(equalToConstant: 76).isActive = true
            }
        }
        
    }
    
    func buttonroundCornersBorder(button : UIButton) {
        
        button.roundCornersBorder(corners: .allCorners, radius: 4, borderWidth: 1, borderColor: #colorLiteral(red: 255, green: 0, blue: 0, alpha: 1))
    }

}
