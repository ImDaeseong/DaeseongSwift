import UIKit

class ViewController2: UIViewController {

    @IBOutlet var imgcollectionView: CarouselCollectionView!
    
    @IBOutlet var cellview: UICollectionViewFlowLayout!
    
    @IBOutlet var pageControl: UIPageControl!
    
    private let imgArr: [UIImage] = [ UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = imgArr.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        

        cellview.minimumLineSpacing = 0
        cellview.minimumInteritemSpacing = 0
        cellview.scrollDirection = .horizontal
        cellview.estimatedItemSize = .zero//estimate size 옵션:none
        
        imgcollectionView.carouselDataSource = self
        imgcollectionView.isAutoscrollEnabled = true
        imgcollectionView.autoscrollTimeInterval = 3.0
        
        //사이즈를 설정해야지만 보임
        let size = UIScreen.main.bounds.size
        //imgcollectionView.flowLayout.itemSize = CGSize(width: size.width / 2, height: size.height)
        imgcollectionView.flowLayout.itemSize = CGSize(width: size.width, height: size.height)
    }
    
}

extension ViewController2: CarouselCollectionViewDataSource  {
    
    var numberOfItems: Int {
        return imgArr.count
    }

    func carouselCollectionView(_ carouselCollectionView: CarouselCollectionView, cellForItemAt index: Int, fakeIndexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imgcollectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell1", for: fakeIndexPath) as! ImgCell1
        cell.imgView.image = imgArr[index]
        cell.imgView.contentMode = .scaleAspectFit
        return cell
    }

    func carouselCollectionView(_ carouselCollectionView: CarouselCollectionView, didSelectItemAt index: Int) {
        print("didSelectItemAt:\(index)")
    }
        
    func carouselCollectionView(_ carouselCollectionView: CarouselCollectionView, didDisplayItemAt index: Int) {
        pageControl.currentPage = index
        //print("didDisplayItemAt:\(index)")
    }
    
}
