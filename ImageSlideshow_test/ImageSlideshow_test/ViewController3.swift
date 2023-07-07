import UIKit
import ImageSlideshow

class ViewController3: UIViewController {

    @IBOutlet var imgslide: ImageSlideshow!
    
    private let imgArr = [
        ImageSource(image:  UIImage(named: "1")!),
        ImageSource(image:  UIImage(named: "2")!),
        ImageSource(image:  UIImage(named: "3")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setImageInputs 호출전에 pageIndicator 생성해야만 화면에 보임
        let pageIndicator = LabelPageIndicator()
        pageIndicator.numberOfPages = imgArr.count
        pageIndicator.textColor = UIColor.white
        pageIndicator.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        imgslide.pageIndicatorPosition = PageIndicatorPosition.init(horizontal: .center, vertical: .customBottom(padding: 20))
        imgslide.pageIndicator = pageIndicator
       
        imgslide.alpha = 0.8
        imgslide.slideshowInterval = 2.0
        imgslide.setImageInputs(imgArr)
        imgslide.contentScaleMode = .scaleAspectFill
        imgslide.delegate = self
        
        imgslide.layer.cornerRadius = 8
        imgslide.layer.masksToBounds = true
    }
}

extension ViewController3 : ImageSlideshowDelegate {
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        
        print("page:\(page)")
    }
}
