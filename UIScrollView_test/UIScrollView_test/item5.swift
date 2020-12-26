import UIKit

class item5: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollview1: UIScrollView!
    
    @IBOutlet weak var pagecontrol1: UIPageControl!
    
    var imgs = ["img2.png", "img2.png", "img2.png", "img2.png", "img2.png" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pagecontrol1.numberOfPages = imgs.count
        pagecontrol1.currentPage = 0
        
        
        scrollview1.delegate = self
        scrollview1.isPagingEnabled = true
        
        scrollview1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollview1.contentSize = CGSize(width: view.frame.width * CGFloat(imgs.count), height: view.frame.height)
        
        for i in 0 ..< imgs.count{
            
            let imgview = UIImageView()
            imgview.image = UIImage(named: imgs[i])
            //imgview.contentMode = .scaleToFill
            imgview.contentMode = .scaleAspectFit
            imgview.frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            
            scrollview1.addSubview(imgview)
        }
        
        self.view.bringSubviewToFront(pagecontrol1)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x / self.view.frame.width)
        pagecontrol1.currentPage = Int(pageIndex)
    }
}
