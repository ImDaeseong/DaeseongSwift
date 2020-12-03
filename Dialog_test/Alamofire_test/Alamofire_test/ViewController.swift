
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
    
    @IBAction func unwindToVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        print(sourceViewController)
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        if #available(iOS 13.0, *) {
        
            guard let vc = self.storyboard?.instantiateViewController(identifier: "item1") else {
                return
            }
            self.present(vc, animated: true)
            
        }
        
    }
    
    @IBAction func btn2_click(_ sender: Any) {
        
        if #available(iOS 13.0, *) {
        
            guard let vc = self.storyboard?.instantiateViewController(identifier: "item2") else {
                return
            }
            self.present(vc, animated: true)
            
        }
    }
    
}

