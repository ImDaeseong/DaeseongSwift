import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet var imgcollectionView: UICollectionView!
    
    private var nPage: Int = 0
    private let imgArr: [UIImage] = [ UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgcollectionView.delegate = self
        imgcollectionView.dataSource = self
    }
}

extension ViewController1: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    //뷰 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imgArr.count
    }
    
    //뷰 안 내용 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imgcollectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell", for: indexPath) as! ImgCell
        let index = indexPath.row
        //print("cellForItemAt:\(index)")
        cell.imgView.image = imgArr[index]
        
        return cell
    }
    
    //뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //print("estimate size 옵션:none")
        return CGSize(width: imgcollectionView.frame.size.width, height: imgcollectionView.frame.size.height)
    }
    
    //현재 페이지 확인 - 수동으로 넘길때만 확인 가능
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let curPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
        let prePage = nPage
        nPage = curPage
        //print("prePage:\(prePage)")
        //print("curPage:\(curPage)")
    }
    
    //선택뷰
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.row
        //print("didSelectItemAt:\(index)")
    }
}
