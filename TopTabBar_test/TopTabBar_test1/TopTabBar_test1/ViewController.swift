
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    @IBOutlet weak var lineview: UIView!
    
    @IBOutlet weak var contentview: UIView!
    
    var VC : UIViewController!
    
    var swipeLeft : UISwipeGestureRecognizer!
    var swipeRight : UISwipeGestureRecognizer!
    
    var Index : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
       
        self.contentview.addGestureRecognizer(swipeLeft)
        self.contentview.addGestureRecognizer(swipeRight)
        
        //default 첫번째 탭 선택
        btn_click(btn1)
    }
    
    @objc func swipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipe = gesture as? UISwipeGestureRecognizer {
            switch swipe.direction {
            case UISwipeGestureRecognizer.Direction.left:
                
                if self.Index < 3 {
                    self.Index += 1
                } else {
                    self.Index = 3
                }
                tabIndex(selectIndex: self.Index)
                
            case UISwipeGestureRecognizer.Direction.right:
                
                if self.Index > 0 {
                    self.Index -= 1
                } else {
                    self.Index = 0
                }
                tabIndex(selectIndex: self.Index)
                
            default:
                break
            }
        }
    }
    
    private func tabIndex(selectIndex : Int) {
        
        if selectIndex == 0 {
            btn_click(btn1)
        } else if selectIndex == 1 {
            btn_click(btn2)
        } else if selectIndex == 2 {
            btn_click(btn3)
        } else if selectIndex == 3 {
            btn_click(btn4)
        }
    }
    
    private func tabBtnColor(selectIndex : Int){
        
        if selectIndex == 0 {
            btn1.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            btn2.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn3.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn4.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
        } else if selectIndex == 1 {
            btn1.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn2.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            btn3.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn4.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
        } else if selectIndex == 2 {
            btn1.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn2.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn3.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            btn4.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
        } else if selectIndex == 3 {
            btn1.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn2.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn3.setTitleColor(#colorLiteral(red: 0.9490196078, green: 0.5960784314, blue: 0.2156862745, alpha: 1), for: .normal)
            btn4.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
    }
    
    @IBAction func btn_click(_ sender: UIButton) {
        
        Index = sender.tag
        
        tabBtnColor(selectIndex: Index)
        
        switch Index {
        
        case 0:
            GetUIViewController(item: "Item1")
            lineview.animate(.identity)
            
        case 1:
            GetUIViewController(item: "Item2")
            lineview.animate(.init(translationX: (lineview.frame.width * 1), y: 0))
            
        case 2:
            GetUIViewController(item: "Item3")
            lineview.animate(.init(translationX: (lineview.frame.width * 2), y: 0))
            
        case 3:
            GetUIViewController(item: "Item4")
            lineview.animate(.init(translationX: (lineview.frame.width * 3), y: 0))
            
        default:
            break
        }
    }
    
    private func GetUIViewController(item : String) {
        
        if VC != nil {
            VC.willMove(toParent: nil)
            VC.view.removeFromSuperview()
            VC.removeFromParent()
        }
        
        VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: item)
        
        self.addChild(VC)
        VC.view.frame = contentview.bounds
        contentview.addSubview(VC.view)
        VC.didMove(toParent: self)
    }
    
}

extension UIView{
    func animate(_ property: CGAffineTransform){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
            self.transform = property
        }, completion: nil)
    }
}
