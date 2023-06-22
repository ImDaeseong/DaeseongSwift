import UIKit
import FlexLayout
import PinLayout

class View2Controller: UIViewController {

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(flexview)
        
        flexview.backgroundColor = .orange
        flexview.flex.margin(100, 10, 10, 10)
        flexview.flex
            .direction(.row)
            .justifyContent(.start)
            .alignItems(.center)
            .define { flex in
                flex.addItem(label1).marginLeft(10).marginTop(10)
                flex.addItem(label2).marginLeft(10).marginTop(10)
                flex.addItem(button1).marginLeft(10).marginTop(10)
            }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        flexview.pin.top().left().width(100%)
        flexview.flex.layout(mode: .adjustHeight)
    }
    
}
