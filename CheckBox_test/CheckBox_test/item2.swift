import UIKit

class item2: UIViewController {
    
    
    @IBOutlet weak var hstackview1: UIStackView!
    
    @IBOutlet weak var btnleft: UIButton!
    
    @IBOutlet weak var btnright: UIButton!
    
    var nClick = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImg(0)
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnleft_click(_ sender: UIButton) {
        setImg(1)
    }
    
    @IBAction func btnright_click(_ sender: UIButton) {
        setImg(2)
    }
    
    func setImg(_ nType : Int){
        
        let img1 = UIImage(named: "img2")
        let img2 = UIImage(named: "img3")
        nClick = nType
        
        if(nType == 1) {
            btnleft.setImage(img2, for: UIControl.State.normal)
            btnright.setImage(img1, for: UIControl.State.normal)
            
        }else if(nType == 2){
            btnleft.setImage(img1, for: UIControl.State.normal)
            btnright.setImage(img2, for: UIControl.State.normal)
            
        }else{
            
            btnleft.setImage(img1, for: UIControl.State.normal)
            btnright.setImage(img1, for: UIControl.State.normal)
        }
    }
    
}
