import UIKit
import Moya

class ViewController1: UIViewController {
    
    let provider = MoyaProvider<ImgApi1>()

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
        
        provider.request(.downloadImg1(sUrl: "")) { result in
            switch result {
            case let .success(response):
                
                //print(response.data)
                
                let request = response.request
                print(request?.url)
                
                guard let img1 = UIImage(data: response.data) else {
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
        
        provider.request(.downloadImg2(sUrl: "")) { result in
            switch result {
            case let .success(response):
                
                //print(response.statusCode)
                //print(response.data)
                
                //let request = response.request
                //print(request?.url)
                
                guard let img1 = UIImage(data: response.data) else {
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
