import UIKit

class item1: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionview1: UICollectionView!
    
    var itemArray : [itemcell]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionview1.allowsMultipleSelection = true
        
        itemArray = [
            itemcell(imgview1: "img1", label1: "img1"),
            itemcell(imgview1: "img2", label1: "img2"),
            itemcell(imgview1: "img3", label1: "img3")
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCellEx1 = collectionView.dequeueReusableCell(withReuseIdentifier: "itemcell", for: indexPath) as! UICollectionViewCellEx1
        
        let item = itemArray[indexPath.item]
        cell.imgview1.image = UIImage(named: item.imgview1)
        cell.label1.text = item.label1
        
        return cell
    }
    
    //cell 선택시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(itemArray[indexPath.item].label1)
    }
    
    //cell 누르고 있을떄
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
    }
    
}
