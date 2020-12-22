
import UIKit

class item1ViewController: UIViewController {
    
    let view1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    let view2 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let imageview3 : UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(named: "img1.png")
        return imageview
    }()
    
    let toplabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "top label"
        label.textColor = UIColor.red
        //label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let underlabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let bottomview : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let bottomunderlabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //view1 화면 전체
        let Top1 = NSLayoutConstraint(item: view1, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let Leading1 = NSLayoutConstraint(item: view1, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let Bottom1 = NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: view1, attribute: .bottom, multiplier: 1, constant: 0)
        let Trailing1 = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: view1, attribute: .trailing, multiplier: 1, constant: 0)
        self.view.addSubview(view1)
        self.view.addConstraints([Top1, Leading1, Bottom1, Trailing1])
        
        //view2 높이 100, 왼/오른쪽 마진 10, 위 마진 100
        let Top2 = NSLayoutConstraint(item: view2, attribute: .top, relatedBy: .equal, toItem: view1, attribute: .top, multiplier: 1, constant: 100)
        let Leading2 = NSLayoutConstraint(item: view2, attribute: .leading, relatedBy: .equal, toItem: view1, attribute: .leading, multiplier: 1, constant: 10)
        let hHeight2 = NSLayoutConstraint(item: view2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 100)
        let Trailing2 = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: view2, attribute: .trailing, multiplier: 1, constant: 10)
        self.view.addSubview(view2)
        self.view.addConstraints([Top2, Leading2, Trailing2, hHeight2])
        
        //imageview3 넓이 50, 높이 50, 가운데
        let wWidth3 = NSLayoutConstraint(item: imageview3, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 50)
        let hHeight3 = NSLayoutConstraint(item: imageview3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50)
        let CenterX3 = NSLayoutConstraint(item: imageview3, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let CenterY3 = NSLayoutConstraint(item: imageview3, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        self.view.addSubview(imageview3)
        self.view.addConstraints([wWidth3, hHeight3, CenterX3, CenterY3])
        
        //toplabel 높이 100, 왼/오른쪽 마진 10, 위 마진 50
        let Top4 = NSLayoutConstraint(item: toplabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 50)
        let Leading4 = NSLayoutConstraint(item: toplabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 10)
        let hHeight4 = NSLayoutConstraint(item: toplabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50)
        let Trailing4 = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: toplabel, attribute: .trailing, multiplier: 1, constant: 10)
        self.view.addSubview(toplabel)
        self.view.addConstraints([Top4, Leading4, Trailing4, hHeight4])
        
        //underlabel 높이 1, 왼/오른쪽 마진 10, 위 마진 0
        let Top5 = NSLayoutConstraint(item: underlabel, attribute: .top, relatedBy: .equal, toItem: toplabel, attribute: .bottom, multiplier: 1, constant: -10)
        let Leading5 = NSLayoutConstraint(item: underlabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 10)
        let hHeight5 = NSLayoutConstraint(item: underlabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 1)
        let Trailing5 = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: underlabel, attribute: .trailing, multiplier: 1, constant: 10)
        self.view.addSubview(underlabel)
        self.view.addConstraints([Top5, Leading5, Trailing5, hHeight5])
        
        //bottomview 높이 100, 왼/오른쪽 마진 0
        let Leading6 = NSLayoutConstraint(item: bottomview, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let Trailing6 = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: bottomview, attribute: .trailing, multiplier: 1, constant: 0)
        let bottom6 = NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: bottomview, attribute: .bottom, multiplier: 1, constant: 0)
        let hHeight6 = NSLayoutConstraint(item: bottomview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 100)
        self.view.addSubview(bottomview)
        self.view.addConstraints([Leading6, Trailing6, bottom6, hHeight6])
        
        //bottomunderlabel 높이 1, 왼/오른쪽 마진 0, 위 마진 0
        let Top7 = NSLayoutConstraint(item: bottomunderlabel, attribute: .top, relatedBy: .equal, toItem: bottomview, attribute: .top, multiplier: 1, constant: 0)
        let Leading7 = NSLayoutConstraint(item: bottomunderlabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let hHeight7 = NSLayoutConstraint(item: bottomunderlabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 1)
        let Trailing7 = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: bottomunderlabel, attribute: .trailing, multiplier: 1, constant: 0)
        self.view.addSubview(bottomunderlabel)
        self.view.addConstraints([Top7, Leading7, Trailing7, hHeight7])
        
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(view1Tapped))
        view1.addGestureRecognizer(tapGesture1)
        view1.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(view2Tapped))
        view2.addGestureRecognizer(tapGesture2)
        view2.isUserInteractionEnabled = true
    }
    
    @objc func view1Tapped() {
        
        if let VC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            
            UIApplication.shared.keyWindow?.rootViewController = VC
        }
    }
    
    @objc func view2Tapped() {
        
    }
}
