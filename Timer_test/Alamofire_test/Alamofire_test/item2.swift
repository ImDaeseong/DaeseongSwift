import UIKit
import Alamofire

class item2: UIViewController {
    
    var imageview1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initImageview()
        
        let url = "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png"
        
        downloadImg(sUrl: url) { data in
            
            if let image = UIImage(data: data) {
                self.imageview1.image = image
                self.imageview1.contentMode = .scaleAspectFill
            }
        }
        
    }
    
    func initImageview(){
        
        let frame = UIScreen.main.bounds
        imageview1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageview1.center = CGPoint(x: frame.width/2, y: frame.height/2)
        self.view.addSubview(imageview1)
        
        self.imageview1.image = UIImage(named: "img1")
        self.imageview1.contentMode = .scaleAspectFill
    }
    
    func downloadImg(sUrl: String, handler: @escaping (Data) -> Void) {
        
        Alamofire.request(sUrl, method: .get, parameters: nil).validate().responseData { (res) in
            switch res.result {
            case .success(let data):
                handler(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   
}
