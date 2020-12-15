
import UIKit

class ViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    var itemArray = ["a","b","c"]
    
    let item = [
        cellItem(txtlabel : "1 이미지", txtImage : "a.png"),
        cellItem(txtlabel : "2 이미지", txtImage : "b.png"),
        cellItem(txtlabel : "3 이미지", txtImage : "c.png"),
        cellItem(txtlabel : "4 이미지", txtImage : "a.png"),
        cellItem(txtlabel : "5 이미지", txtImage : "b.png"),
        cellItem(txtlabel : "6 이미지", txtImage : "c.png")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = UIColor.white
        //self.collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return item.count
        //return itemArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICell", for: indexPath) as! UICell
        
        //print(item[indexPath.item])
        cell.imgview.image = UIImage(named: "\(item[indexPath.item].txtImage)")
        cell.label.text = item[indexPath.item].txtlabel
        
        /*
        //print(itemArray[indexPath.item])
        cell.imgview.image = UIImage(named: "\(itemArray[indexPath.item]).png")
        cell.label.text = itemArray[indexPath.row]
        */
        
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 0.3
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //print("view.frame.width:\(view.frame.width)")
        //print("view.frame.height:\(view.frame.height)")
        //print("collectionView.frame.width:\(collectionView.frame.width)")
        //print("collectionView.frame.height:\(collectionView.frame.height)")
       
        var height : CGFloat = ( collectionView.frame.height / 3)
        
        //itme size
        return CGSize(width: collectionView.frame.width - 20, height: height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            
        //상단 공백
        return CGSize(width: view.frame.width, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        //라인 간격 20
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        //같은 행에 있는 아이템 간격 10
        return 10
    }
}
