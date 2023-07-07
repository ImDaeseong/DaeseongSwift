import UIKit
import ImageSlideshow

class ViewController1: UIViewController {

    @IBOutlet var imgslide: ImageSlideshow!
    
    private let imgArr = [
        ImageSource(image:  UIImage(named: "1")!),
        ImageSource(image:  UIImage(named: "2")!),
        ImageSource(image:  UIImage(named: "3")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imgTapped))
        imgslide.addGestureRecognizer(tapGesture)

        //ImageSlideshow 에서 제공하는 UIPageControl 숨김
        imgslide.pageIndicator = nil
        
        imgslide.backgroundColor = UIColor.clear
        imgslide.slideshowInterval = 2.0
        imgslide.scrollView.isScrollEnabled = true
        imgslide.scrollView.showsVerticalScrollIndicator = false
        
        imgslide.setImageInputs(imgArr)
        imgslide.contentScaleMode = .scaleToFill
        imgslide.zoomEnabled = true
        imgslide.delegate = self
    }
    
    @objc func imgTapped() {
        
        let index = imgslide.currentPage
        print("index:\(index)")
    }
}

extension ViewController1 : ImageSlideshowDelegate {
    
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        
        print("page:\(page)")
    }
}
