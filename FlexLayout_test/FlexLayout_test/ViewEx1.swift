import UIKit
import FlexLayout
import PinLayout

final class ViewEx1: UIView {

    let flexview = UIView()
    
    let label1 : UILabel = {
        
        let label1 = UILabel()
        label1.text = "label1"
        label1.textColor = .black
        label1.textAlignment = .center
        label1.font = .systemFont(ofSize: 12)
        //label1.numberOfLines = 0  자동줄바꿈
        label1.numberOfLines = 1
        
        return label1
    }()
    
    let label2 : UILabel = {
        
        let label2 = UILabel()
        label2.text = "label2"
        label2.textColor = .black
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 12)
        //label2.numberOfLines = 0  자동줄바꿈
        label2.numberOfLines = 1
        
        return label2
    }()
    
    let button1 : UIButton = {
        
        let button1 = UIButton()
        button1.setTitle("button1", for: UIControl.State.normal)
        button1.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button1.titleLabel?.font = .systemFont(ofSize: 12)
        button1.backgroundColor = .gray
        //button1.layer.borderWidth = 1
        //button1.layer.cornerRadius = 8
        
        return button1
    }()
    
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.addSubview(flexview)
        flexview.backgroundColor = .orange
        
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
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        flexview.pin.top(100).left(10).right(10).height(100)
        flexview.flex.layout(mode: .fitContainer)
    }
    
}
