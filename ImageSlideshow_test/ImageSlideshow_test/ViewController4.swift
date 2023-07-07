import UIKit
import ImageSlideshow

class ViewController4: UIViewController {

    @IBOutlet var imgslide: ImageSlideshow!
    
    @IBOutlet var pageControl: UIPageControl!
    
    private let imgArr = [
        ImageSource(image:  UIImage(named: "1")!),
        ImageSource(image:  UIImage(named: "2")!),
        ImageSource(image:  UIImage(named: "3")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ImageSlideshow 에서 제공하는 UIPageControl 숨김
        imgslide.pageIndicator = nil
      
        
        pageControl.numberOfPages = imgArr.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.orange

        imgslide.backgroundColor = UIColor.white
        imgslide.slideshowInterval = 2.0
        imgslide.setImageInputs(imgArr)
        imgslide.contentScaleMode = .scaleAspectFill
        
        imgslide.layer.cornerRadius = 8
        imgslide.layer.masksToBounds = true
        
        
        //pagcontrol 를 imgslide 위로 위치시킨다
        imgslide.bringSubviewToFront(pageControl)
                
        imgslide.currentPageChanged = { [weak self] page in
                    self?.pageControl.currentPage = page
                }
        
    }

}
