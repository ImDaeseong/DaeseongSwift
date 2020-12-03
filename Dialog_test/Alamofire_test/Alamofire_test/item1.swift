import UIKit
import Alamofire

class item1: UIViewController {
    
    var imageview1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initImageview()
        
        downloadImg()
    }
    
    func initImageview(){
        
        let frame = UIScreen.main.bounds
        imageview1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageview1.center = CGPoint(x: frame.width/2, y: frame.height/2)
        imageview1.backgroundColor = UIColor.gray
        self.view.addSubview(imageview1)
    }
    
    func downloadImg() {
        
        let request = Alamofire.request("https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png", method: .get, parameters: nil)
        request.response{ res in
            
            //print(res.request)
            //print(res.response)
            //print(res.data)
            //print(res.error)
            
            if res.error == nil {
                let image = UIImage(data: res.data!)
                self.imageview1.image = image
                self.imageview1.contentMode = .scaleAspectFill
            } else {
                self.imageview1.image = UIImage(named: "img1")
                self.imageview1.contentMode = .scaleAspectFill
            }
            
        }
    }
    
}
