import UIKit

class UIViewEx7 : UIView {
    
    var isDispplay = true
    
    let img1 : UIImageView = {
        let img1 = UIImageView()
        img1.translatesAutoresizingMaskIntoConstraints = false
        img1.contentMode = .scaleAspectFit
        img1.clipsToBounds = true
        img1.image = UIImage(named: "img1")
        return img1
    }()
    
    let img2 : UIImageView = {
        let img2 = UIImageView()
        img2.translatesAutoresizingMaskIntoConstraints = false
        img2.contentMode = .scaleAspectFit
        img2.clipsToBounds = true
        img2.image = UIImage(named: "img2")
        return img2
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addSubview(img1)
        self.addSubview(img2)
        img2.isHidden = true
        
        let Top1 = NSLayoutConstraint(item: img1, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let Left1 = NSLayoutConstraint(item: img1, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let Right1 = NSLayoutConstraint(item: img1, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let Bottom1 = NSLayoutConstraint(item: img1, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        
        let Top2 = NSLayoutConstraint(item: img2, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let Left2 = NSLayoutConstraint(item: img2, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0)
        let Right2 = NSLayoutConstraint(item: img2, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0)
        let Bottom2 = NSLayoutConstraint(item: img2, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        
        self.addConstraints([Top1, Left1, Right1, Bottom1])
        self.addConstraints([Top2, Left2, Right2, Bottom2])
    }
    
    func flip(){
        
        let transitionOptions : UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: img1, duration: 1.0, options: transitionOptions, animations : {
            
            if (self.isDispplay == true) {
                self.img1.isHidden = true
            }else {
                self.img1.isHidden = false
            }
        })
        
        UIView.transition(with: img2, duration: 1.0, options: transitionOptions, animations : {
            
            if (self.isDispplay == true) {
                self.img2.isHidden = false
            }else {
                self.img2.isHidden = true
            }
        })
        
        self.isDispplay = !self.isDispplay
    }
    
}
