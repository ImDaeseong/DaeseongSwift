import UIKit

class item6: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var scrollview1: UIScrollView!
    
    @IBOutlet weak var pagecontrol1: UIPageControl!
    
    var imgs = ["img2.png", "img2.png", "img2.png", "img2.png", "img2.png" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pagecontrol1.numberOfPages = imgs.count
        pagecontrol1.currentPage = 0
        pagecontrol1.pageIndicatorTintColor = UIColor.gray
        pagecontrol1.currentPageIndicatorTintColor = UIColor.orange
        
        scrollview1.delegate = self
        scrollview1.isPagingEnabled = true
        scrollview1.showsVerticalScrollIndicator = false
        scrollview1.showsHorizontalScrollIndicator = true
        
        let width = view.frame.width - 20
        
        scrollview1.frame = CGRect(x: 0, y: 0, width: width, height: view1.frame.height)
        scrollview1.contentSize = CGSize(width: width * CGFloat(imgs.count), height: view1.frame.height)
        
        for i in 0 ..< imgs.count {
            
            let imgview = UIImageView()
            imgview.image = UIImage(named: imgs[i])
            imgview.frame = CGRect(x: width * CGFloat(i), y: 0, width: width, height: view1.frame.height)
            
            scrollview1.addSubview(imgview)
        }
        self.view.bringSubviewToFront(pagecontrol1)
    }
}

extension item6 : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let width = view.frame.width - 20
        
        let pageIndex = round(scrollView.contentOffset.x / width)
        pagecontrol1.currentPage = Int(pageIndex)
    }
}
