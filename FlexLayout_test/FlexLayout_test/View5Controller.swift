import UIKit
import FlexLayout
import PinLayout

class View5Controller: UIViewController {

    private let flexview = UIView()
    
    private let img1 = UIImageView(image: UIImage(named: "img1"))
    
    private let label1 : UILabel = {
        
        let label1 = UILabel()
        label1.text = "label1"
        label1.textColor = .black
        label1.textAlignment = .center
        label1.font = .systemFont(ofSize: 12)
        label1.backgroundColor = .gray
        label1.numberOfLines = 1
        
        return label1
    }()
    
    private let label2 : UILabel = {
        
        let label2 = UILabel()
        label2.text = "label2"
        label2.textColor = .black
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 12)
        label2.backgroundColor = .gray
        label2.numberOfLines = 1
        
        return label2
    }()
    
    private let button1 : UIButton = {
        
        let button1 = UIButton()
        button1.setTitle("button1", for: UIControl.State.normal)
        button1.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button1.titleLabel?.font = .systemFont(ofSize: 12)
        button1.backgroundColor = .gray
        
        return button1
    }()
    
    private let button2 : UIButton = {
        
        let button2 = UIButton()
        button2.setTitle("button2", for: UIControl.State.normal)
        button2.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button2.titleLabel?.font = .systemFont(ofSize: 12)
        button2.backgroundColor = .gray
        
        return button2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(flexview)
        
        //loadUI(nType: 1)
        //loadUI(nType: 2)
        loadUI(nType: 3)
    }
    
    private func loadUI(nType : Int) {
        
        if nType == 1 {
            
            flexview.flex.marginTop(100).marginLeft(10).marginRight(10).marginBottom(50).define { flex in
                
                flex.addItem().direction(.row).define { flex in
                    flex.addItem(img1).width(100).aspectRatio(of: img1)
                    flex.addItem().marginLeft(10).grow(1).shrink(1).define { flex in
                        flex.addItem(label1).marginBottom(1).grow(1)
                        flex.addItem(label2).marginTop(1).grow(1)
                    }
                }
                flex.addItem().height(1).marginTop(10).backgroundColor(.gray)
            }
            
        } else if nType == 2 {
            
            flexview.flex.marginTop(100).marginLeft(10).marginRight(10).marginBottom(50).define { flex in
                
                flex.addItem().direction(.row).backgroundColor(.orange).define { flex in
                    
                    flex.addItem(img1).width(100).grow(1).shrink(1).aspectRatio(of: img1).marginLeft(10).marginTop(0)
                    flex.addItem(label1).grow(1).shrink(1).marginLeft(10).marginTop(0)
                    flex.addItem(label2).grow(1).shrink(1).marginLeft(10).marginTop(0).marginRight(10)
                }
                flex.addItem().height(1).marginTop(1).backgroundColor(.gray)
            }
            
        } else if nType == 3 {
            
            flexview.flex.marginTop(100).marginLeft(10).marginRight(10).marginBottom(50).define { flex in
                
                flex.addItem().direction(.row).justifyContent(.spaceBetween).backgroundColor(.orange).define { flex in
                    flex.addItem(label1)
                    flex.addItem(button1)
                }
                
                flex.addItem().direction(.row).justifyContent(.spaceBetween).backgroundColor(.red).define { flex in
                    flex.addItem(label2)
                    flex.addItem(button2)
                }
                flex.addItem().height(1).marginTop(10).backgroundColor(.gray)
            }
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        flexview.frame = view.bounds
        flexview.flex.layout()
    }

}
