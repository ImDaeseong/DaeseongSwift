import UIKit

class ViewController3: UIViewController {

    @IBOutlet var imgcollectionView: UICollectionView!
    
    //데이터 순서 : 마지막, 1, 2, 3, 첫번째
    private let imgArr: [UIImage] = [ UIImage(named: "3")!, UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "1")!]
    
    private var nCurrentIndex : Int = 0
    
    private var bTimeFlag : Bool = false
    private var vTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgcollectionView.delegate = self
        imgcollectionView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //첫번째 데이터 설정
        nCurrentIndex = 1
        imgcollectionView.scrollToItem(at: IndexPath(row: nCurrentIndex, section: 0), at: .centeredHorizontally, animated: false)
        
        startTimer()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        stopTimer()
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
    
    @objc func scrollToNextItem() {
        
        if bTimeFlag == true {
            print("수동으로 스크롤 중이면 실행하지 않는다")
            return
        }
        
        var index = nCurrentIndex + 1
        //print(index)
        
        if index >= imgArr.count {
            nCurrentIndex = 1
            imgcollectionView.scrollToItem(at: IndexPath(row: nCurrentIndex, section: 0), at: .centeredHorizontally, animated: false)
        } else {
            nCurrentIndex = index
            imgcollectionView.scrollToItem(at: IndexPath(row: nCurrentIndex, section: 0), at: .centeredHorizontally, animated: true)
        }
    }
}

extension ViewController3: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    //뷰 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imgArr.count
    }
    
    //뷰 안 내용 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imgcollectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell2", for: indexPath) as! ImgCell2
        let index = indexPath.item
        cell.imgView.image = imgArr[index]
        
        return cell
    }
    
    //뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //print("estimate size 옵션:none")
        return CGSize(width: imgcollectionView.frame.size.width, height: imgcollectionView.frame.size.height)
    }
    
    //수동 스크롤 시작시
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        stopTimer()
        bTimeFlag = true
    }
    
    //수동 스크롤 끝날때
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       
        var index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
        print("index:\(index)")
        
        if index == 0 {
            
            //마지막 데이터
            index = imgArr.count - 2
            
        } else if index == imgArr.count - 1 {
            
            //첫번째 데이터
            index =  1
        }
        
        nCurrentIndex = index
        imgcollectionView.scrollToItem(at: IndexPath(row: nCurrentIndex, section: 0), at: .centeredHorizontally, animated: false)
        
        bTimeFlag = false
        startTimer()
    }
    
    //선택뷰
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.item
        //print("didSelectItemAt:\(index)")
    }
}
