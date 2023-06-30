import UIKit
import Alamofire

class ViewController1: UIViewController {

    private var imageview1: UIImageView = {
        
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        img.backgroundColor = UIColor.clear
        
        return img
    }()
    
    private var imageview2: UIImageView = {
        
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        img.backgroundColor = UIColor.clear
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageview1)
        view.addSubview(imageview2)
        
        imageview1.translatesAutoresizingMaskIntoConstraints = false
        imageview1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageview1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageview1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageview1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        imageview2.translatesAutoresizingMaskIntoConstraints = false
        imageview2.leadingAnchor.constraint(equalTo: imageview1.leadingAnchor).isActive = true
        imageview2.trailingAnchor.constraint(equalTo: imageview1.trailingAnchor).isActive = true
        imageview2.topAnchor.constraint(equalTo: imageview1.bottomAnchor, constant: 10).isActive = true
        imageview2.heightAnchor.constraint(equalToConstant: imageview1.frame.height).isActive = true
        imageview2.widthAnchor.constraint(equalToConstant: imageview1.frame.width).isActive = true
        
        loadImg()
    }
    
    private func loadImg() {
        
        let Url1 = "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png"
        let Url2 = "https://cdn.pixabay.com/photo/2016/03/23/08/34/woman-1274361_960_720.jpg"
    
        
        AF.request(Url1, method: .get, parameters: nil).responseData { response in
            switch response.result {
            case .success(let imgdata):
                
                guard let img1 = UIImage(data: imgdata) else {
                    print("error")
                    return
                }
                
                DispatchQueue.main.async {
                    self.imageview1.image = img1
                }
             
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        
        AF.request(Url2, method: .get, parameters: nil).responseData { response in
            switch response.result {
            case .success(let imgdata):
                
                guard let img1 = UIImage(data: imgdata) else {
                    print("error")
                    return
                }
                
                DispatchQueue.main.async {
                    self.imageview2.image = img1
                }
             
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
