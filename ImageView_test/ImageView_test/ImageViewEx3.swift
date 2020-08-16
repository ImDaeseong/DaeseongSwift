import UIKit

class ImageViewEx3 : UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear

        //gradientLefttoRight()
        //gradientRighttoLeft()
        //gradientUptoDown()
        gradientDowntoUp()
    }
    
    func gradientLefttoRight(){
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor]
        gradient.locations = [0.5, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func gradientRighttoLeft(){
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor]
        gradient.locations = [0.5, 1]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func gradientUptoDown(){
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor]
        gradient.locations = [0.5, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
    }

    func gradientDowntoUp(){
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor]
        gradient.locations = [0.5, 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
