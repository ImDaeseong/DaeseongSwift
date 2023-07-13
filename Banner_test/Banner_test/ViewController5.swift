import UIKit

class ViewController5: UIViewController {

    @IBOutlet var imgcollectionView: UICollectionView!
    
    @IBOutlet var cellview: UICollectionViewFlowLayout!
    
    @IBOutlet var pageControl: UIPageControl!
    
    private var nCurrentIndex: Int = 0
    private let imgArr: [UIImage] = [ UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!]
    
    private var nTotalCount : Int = 0
    
    private lazy var imgArrFake : [UIImage] = {
        imgArr + imgArr + imgArr
    }()
    
    private var bStart : Bool = false
    private var bEnd : Bool = false
    
    private var vTimer: Timer!
    
    
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
        
        imgcollectionView.showsVerticalScrollIndicator = false
        imgcollectionView.showsHorizontalScrollIndicator = false
        imgcollectionView.isPagingEnabled = true
        imgcollectionView.delegate = self
        imgcollectionView.dataSource = self
        
        nTotalCount = imgArr.count
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imgcollectionViewTap))
        imgcollectionView.addGestureRecognizer(tapGesture)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //print("nTotalCount:\(nTotalCount)")
        imgcollectionView.scrollToItem(at: IndexPath(row: nTotalCount, section: 0), at: .centeredHorizontally, animated: false)
        startTimer()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    private func startTimer() {
        
        if vTimer == nil {
            vTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
        }
    }
    
    private func stopTimer() {
        
        if vTimer != nil {
            vTimer.invalidate()
            vTimer = nil
        }
    }
    
    @objc func imgcollectionViewTap() {
        
        if vTimer != nil {
            
            //print("stopTimer")
            stopTimer()
            
        } else {
            
            //print("startTimer")
            startTimer()
        }
    }
    
    @objc func scrollToNextItem() {
        
        guard let visibleItem = imgcollectionView.indexPathsForVisibleItems.first else {
            return
        }
        //print("visibleItems:\(visibleItem)")
            
        let nextItemIndex = (visibleItem.item + 1) % imgArrFake.count
        let nextItem = IndexPath(item: nextItemIndex, section: visibleItem.section)
            
        if nextItemIndex > visibleItem.item {
            
            //오른쪽으로 스크롤
            imgcollectionView.scrollToItem(at: nextItem, at: .centeredHorizontally, animated: true)
            
        } else {
            
            //이미지 개수 마지막일 경우 스크롤 중지했다가 다시 오른쪽으로 스크롤
            imgcollectionView.scrollToItem(at: IndexPath(item: 0, section: visibleItem.section), at: .centeredHorizontally, animated: false)
            imgcollectionView.scrollToItem(at: IndexPath(item: 1, section: visibleItem.section), at: .centeredHorizontally, animated: true)
        }
        
    }
    
}


extension ViewController5: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    //뷰 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imgArrFake.count
    }
    
    //뷰 안 내용 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imgcollectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell4", for: indexPath) as! ImgCell4
        let index = indexPath.item
        cell.imgView.image = imgArrFake[index]
        return cell
    }
    
    //뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //print("estimate size 옵션:none")
        return CGSize(width: imgcollectionView.frame.size.width, height: imgcollectionView.frame.size.height)
    }
    
    //선택뷰
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.item % nTotalCount
        print("didSelectItemAt:\(index)")
    }
    
    //스크롤 드래그 끝났을떄
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
     
        let nStart = imgcollectionView.frame.width * CGFloat(nTotalCount)
        let nEnd = imgcollectionView.frame.width * CGFloat(nTotalCount * 2 - 1)
        
        //print("nStart:\(nStart)")
        //print("nEnd:\(nEnd)")
        //print("scrollView.contentOffset.x:\(scrollView.contentOffset.x)")
        //print("velocity:\(velocity)")
        
        if scrollView.contentOffset.x < nStart && velocity.x < .zero {
            
            //print("마지막으로")
            bEnd = true
            
        } else if scrollView.contentOffset.x > nEnd && velocity.x > .zero {
            
            //print("처음으로")
            bStart = true
        }
    }
    
    //스크롤 움직임 멈춤
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if bStart {
            imgcollectionView.scrollToItem(at: IndexPath(item: nTotalCount, section: 0), at: .centeredHorizontally, animated: false)
            bStart.toggle()
            return
        }
        
        if bEnd {
            imgcollectionView.scrollToItem(at: IndexPath(item: nTotalCount * 2 - 1, section: 0), at: .centeredHorizontally, animated: false)
            bEnd.toggle()
            return
        }
    }
    
    //페이지가 변경 될떄
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x / scrollView.bounds.width)
        let index = Int(pageIndex) % nTotalCount
        pageControl.currentPage = index
        //print(index)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        //print("사용자 스크롤 시작")
        stopTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        //print("사용자 스크롤 끝")
        startTimer()
    }
    
}
