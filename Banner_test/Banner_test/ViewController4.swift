import UIKit

class ViewController4: UIViewController {

    @IBOutlet var imgcollectionView: UICollectionView!
    
    private let imgArr: [UIImage] = [ UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgcollectionView.delegate = self
        imgcollectionView.dataSource = self
    }
}

extension ViewController4: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    //뷰 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imgArr.count
    }
    
    //뷰 안 내용 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = imgcollectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell3", for: indexPath) as! ImgCell3
        let index = indexPath.item
        cell.imgView.image = imgArr[index]
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.cornerRadius = 4
        
        return cell
    }
    
    //뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: imgcollectionView.frame.size.width / 1.5, height: imgcollectionView.frame.size.height)
    }
    
    //선택뷰
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let index = indexPath.item
        //print("didSelectItemAt:\(index)")
    }
}
