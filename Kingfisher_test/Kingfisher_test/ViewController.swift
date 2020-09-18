
import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageview1: UIImageView!
    
    let url = "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setImage(surl: url)
        
        setImagecache(surl: url)
    }
    
    func setImage(surl : String){
        let defaultimg = UIImage(named: "img1.png")
        imageview1.kf.setImage(with: URL(string: surl), placeholder: defaultimg)
        imageview1.contentMode = .scaleAspectFit
    }
    
    func setImagecache(surl : String){
        
        let cache = ImageCache.default
        cache.retrieveImage(forKey: surl, options: nil) { (Image, CacheType) in
            
            if let image = Image{
                //cache
                self.imageview1.image = image
                
            } else {
                //no cache
                guard let url = URL(string: surl) else { return }
                let res = ImageResource(downloadURL: url, cacheKey: surl)
                self.imageview1.kf.setImage(with: res)
            }
            
            //cache remove
            //cache.removeImage(forKey: surl)
        }
        
    }
    
}

