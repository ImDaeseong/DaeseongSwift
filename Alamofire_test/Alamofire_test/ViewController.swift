import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var imageview1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImg()
    }

    @IBAction func button1_Click(_ sender: Any) {
        
        if #available(iOS 13.0, *) {
        
            guard let vc = self.storyboard?.instantiateViewController(identifier: "item1") else {
                return
            }
            self.present(vc, animated: true)
            
        } else {
            
            let mainboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainboard.instantiateViewController(withIdentifier : "item1")
            self.present(vc, animated: true)
            
        }
    }
    
    @IBAction func button2_Click(_ sender: Any) {
        
        if #available(iOS 13.0, *) {
        
            guard let vc = self.storyboard?.instantiateViewController(identifier: "item2") else {
                return
            }
            self.present(vc, animated: true)
            
        } else {
            
            let mainboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainboard.instantiateViewController(withIdentifier : "item2")
            self.present(vc, animated: true)
            
        }
    }
    
    @IBAction func button3_Click(_ sender: Any) {
        
        if #available(iOS 13.0, *) {
        
            guard let vc = self.storyboard?.instantiateViewController(identifier: "item3") else {
                return
            }
            self.present(vc, animated: true)
            
        } else {
            
            let mainboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainboard.instantiateViewController(withIdentifier : "item3")
            self.present(vc, animated: true)
            
        }
    }
    
    @IBAction func unwindToVC(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    private func loadImg() {
        
        let Url = "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png"
        
        downloadImg(sUrl: Url) { imgdata in
            
            guard let img1 = UIImage(data: imgdata) else {
                print("error")
                return
            }
            
            DispatchQueue.main.async {
                self.imageview1.image = img1
            }
        }
    }

    
    func downloadImg(sUrl: String, handler: @escaping (Data) -> Void) {
        
        AF.request(sUrl, method: .get, parameters: nil).validate().responseData { response in
            switch response.result {
            case .success(let data):
                handler(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

