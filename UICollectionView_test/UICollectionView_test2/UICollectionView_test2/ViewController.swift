import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView1: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    let item = [
        cellItem(txtlabel : "1 이미지", txtImage : "a.png"),
        cellItem(txtlabel : "2 이미지", txtImage : "a.png"),
        cellItem(txtlabel : "3 이미지", txtImage : "a.png"),
        cellItem(txtlabel : "4 이미지", txtImage : "a.png"),
        cellItem(txtlabel : "5 이미지", txtImage : "a.png"),
        cellItem(txtlabel : "6 이미지", txtImage : "a.png")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICell", for: indexPath) as! UICell
        
        print(item[indexPath.item])
        
        cell.imgview1.image = UIImage(named: "\(item[indexPath.item].txtImage)")
        cell.label1.text = item[indexPath.item].txtlabel
        
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        //상단 영역 50
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = ( collectionView.frame.width / 2.0)
        return CGSize(width: size - 10, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        //라인 간격 10
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        //같은 행에 있는 아이템 간격 0
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
