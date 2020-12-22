
import UIKit

class ViewController: UIViewController {

    let imglist = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"]

    var Flowlayout : UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(itemCell.nib(), forCellWithReuseIdentifier: itemCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        initFlowLayout()
    }
    
    private func initFlowLayout(){
        
        if Flowlayout == nil {
            
            let width : CGFloat = ( collectionView.frame.width / 2.0) - 50
            
            Flowlayout = UICollectionViewFlowLayout()
            Flowlayout.itemSize = CGSize(width: width, height: 72)
            Flowlayout.sectionInset = UIEdgeInsets.zero
            Flowlayout.scrollDirection = .vertical
            Flowlayout.minimumLineSpacing = 0
            Flowlayout.minimumInteritemSpacing = 0
            collectionView.setCollectionViewLayout(Flowlayout, animated: true)
        }
    }
}

extension ViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("indexPath:\(indexPath)")
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imglist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemCell.identifier, for: indexPath) as! itemCell
        
        cell.configure(with: UIImage(named: imglist[indexPath.row])!)
        
        return cell
    }
    
}
