

import UIKit

var imgs = ["a.jpg", "b.jpg", "c.jpg", "d.jpg"]

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = imgs.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: imgs[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        
        imgView.image = UIImage(named: imgs[pageControl.currentPage])
    }
    
}

