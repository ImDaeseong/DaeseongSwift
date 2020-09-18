
import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imageview1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageview1.image = UIImage(named: "img1")
        self.imageview1.contentMode = .scaleAspectFill
        
        
        downloadImg(sUrl: "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png", completion: { data in
            
            if let image = UIImage(data: data) {
                self.imageview1.image = image
                self.imageview1.contentMode = .scaleAspectFill
            }
        })
    }
    
    func downloadImg(sUrl: String, completion: @escaping (Data) -> Void) {
        
        Alamofire.request(sUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:]).responseData { (res) in
            switch res.result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

