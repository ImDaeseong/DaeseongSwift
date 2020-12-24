
import UIKit

class ViewController: UIViewController {

    var imglist = [ UIImage(named: "a"),
                    UIImage(named: "a"),
                    UIImage(named: "a"),
                    UIImage(named: "a"),
                    UIImage(named: "a"),
                    UIImage(named: "a"),
                    UIImage(named: "a"),
                    UIImage(named: "a"),
                    UIImage(named: "a"),
                    UIImage(named: "a") ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var timer = Timer()
    var nCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UICollectionView 설정
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        //UIPageControl 설정
        pageControl.numberOfPages = imglist.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .systemOrange
        
        //Timer 시작
        initTimer()
    }
    
    func initTimer(){
        
        DispatchQueue.main.async {
           self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    @objc func changeImage(){
      
        if nCount < imglist.count {
            
            let index = IndexPath.init(item: nCount, section: 0)
            
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            self.pageControl.currentPage = nCount
            
            self.nCount += 1
            
        } else {
            
            self.nCount = 0
            
            let index = IndexPath.init(item: nCount, section: 0)
            
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            
            self.pageControl.currentPage = nCount
        }
        
    }
}

extension ViewController : UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        self.nCount = indexPath.row
        self.pageControl.currentPage = self.nCount
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imglist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! itemCell
        cell.imgview1.image = imglist[indexPath.row]
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("didSelectItemAt:\(indexPath.row)")
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //이미지 사이즈
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
}
