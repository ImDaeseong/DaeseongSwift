
import UIKit

class Splash: UIViewController {
    
    let imageview1 : UIImageView = {
        let imageview1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageview1.translatesAutoresizingMaskIntoConstraints = false
        imageview1.image = UIImage(named: "img2.png")
        return imageview1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        //imageview1.center = view.center
        //view.addSubview(imageview1)
        
        let wWidth = NSLayoutConstraint(item: imageview1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 150)
        let hHeight = NSLayoutConstraint(item: imageview1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 150)
        let CenterX = NSLayoutConstraint(item: imageview1, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let CenterY = NSLayoutConstraint(item: imageview1, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        self.view.addSubview(imageview1)
        self.view.addConstraints([wWidth, hHeight, CenterX, CenterY])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loadImg()
    }
    
    func loadImg(){
        
        UIView.animate(withDuration: 2.0, animations: {
            self.imageview1.alpha = 0.0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    
                    //mainVC
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyBoard.instantiateViewController(withIdentifier: "mainVC") as! ViewController
                    self.present(vc, animated: false, completion : nil)
                })
            }
        })
        
    }
    
}
