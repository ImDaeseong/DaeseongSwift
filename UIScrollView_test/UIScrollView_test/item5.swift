import UIKit

class item5: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollview1: UIScrollView!
    
    @IBOutlet weak var pagecontrol1: UIPageControl!
    
    var imgs = ["img1.png", "img1.png", "img1.png", "img1.png", "img1.png" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollview1.delegate = self
        
        pagecontrol1.numberOfPages = imgs.count
        pagecontrol1.currentPage = 0
        
        //print("width: \(self.scrollview1.frame.width)")
        //print("height: \(self.scrollview1.frame.height)")
        
        for i in 0 ..< imgs.count{
            let imgview = UIImageView()
            imgview.image = UIImage(named: imgs[i])
            imgview.contentMode = .scaleAspectFit
            
            let x = self.scrollview1.frame.width * CGFloat(i)
            //print("locationX: \(x)")
            
            imgview.frame = CGRect(x: x, y: 0, width: self.scrollview1.frame.width, height: self.scrollview1.frame.height)
            
            scrollview1.contentSize.width = self.scrollview1.frame.width * CGFloat(1+i)
            scrollview1.addSubview(imgview)
        }
        
        self.view.bringSubviewToFront(pagecontrol1)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let current = round(scrollView.contentOffset.x / self.scrollview1.frame.width)
        
        //print(current)
        
        pagecontrol1.currentPage = Int(CGFloat(current))
    }
}
