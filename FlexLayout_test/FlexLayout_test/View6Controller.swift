import UIKit
import FlexLayout
import PinLayout

class View6Controller: UIViewController {

    private let flexview = UIView()
    
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

        flexview.flex.width(100%).direction(.column).marginTop(100).padding(10).define { flex in
            
            flex.addItem().direction(.row).justifyContent(.spaceBetween).define { flex in
                
                flex.addItem(button1).grow(1).marginRight(10)
                flex.addItem(button2).grow(1)
            }
            
            flex.addItem().height(1).marginTop(10).marginBottom(10).backgroundColor(.gray)
            
            flex.addItem().justifyContent(.center).define { flex in
                
                flex.addItem().direction(.column).define { flex in
                    
                    flex.addItem(label1).marginBottom(5)
                    flex.addItem(label2).marginBottom(5)
                }
            }
        }
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        flexview.frame = view.bounds
        flexview.flex.layout()
        
        //flexview.flex.layout(mode: .adjustHeight)
    }

}
