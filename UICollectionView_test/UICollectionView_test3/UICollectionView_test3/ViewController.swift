
import UIKit

class ViewController: UIViewController {
    
    let imglist = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a", "a"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width : CGFloat = ( collectionView.frame.width / 2.0) - 5
        
        let Flowlayout = UICollectionViewFlowLayout()
        Flowlayout.itemSize = CGSize(width: width, height: 75)
        collectionView.collectionViewLayout = Flowlayout
        
        collectionView.register(itemCell.nib(), forCellWithReuseIdentifier: itemCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
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
        cell.layer.cornerRadius = cell.frame.height / 10.0
        
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width : CGFloat = ( collectionView.frame.width / 2.0) - 5
        
        return CGSize(width: width, height: 75)
    }
    
}

