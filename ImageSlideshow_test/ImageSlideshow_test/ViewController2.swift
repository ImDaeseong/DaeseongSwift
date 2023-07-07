import UIKit
import ImageSlideshow

class ViewController2: UIViewController {

    @IBOutlet var imgslide: ImageSlideshow!
    
    private let imgArr = [
        ImageSource(image:  UIImage(named: "1")!),
        ImageSource(image:  UIImage(named: "2")!),
        ImageSource(image:  UIImage(named: "3")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setImageInputs 호출전에 pageIndicator 생성해야만 화면에 보임
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.orange
        pageIndicator.pageIndicatorTintColor = UIColor.white
        imgslide.pageIndicatorPosition = PageIndicatorPosition.init(horizontal: .center, vertical: .bottom)
        imgslide.pageIndicator = pageIndicator
       
        imgslide.slideshowInterval = 2.0
        imgslide.setImageInputs(imgArr)
        imgslide.contentScaleMode = .scaleAspectFill
        imgslide.delegate = self
    }

}

extension ViewController2 : ImageSlideshowDelegate {
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        
        print("page:\(page)")
    }
}
