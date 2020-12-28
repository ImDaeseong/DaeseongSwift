
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabmenuview: UICollectionView!
    
    @IBOutlet weak var contentview: UIView!
    
    var tabmenuName: [String] = ["tab1", "tab2", "tab3", "tab4"]
    var selectIndex : Int = 0
    
    var VC : UIViewController!
    
    var swipeLeft : UISwipeGestureRecognizer!
    var swipeRight : UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabmenuview.delegate = self
        tabmenuview.dataSource = self
        
        tabmenuview.isScrollEnabled = false
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
       
        self.contentview.addGestureRecognizer(swipeLeft)
        self.contentview.addGestureRecognizer(swipeRight)
        
        //default 첫번째 탭 선택
        SelecttabIndex(selectIndex: selectIndex)
    }
  
    private func GetUIViewController(item : String) {
        
        if VC != nil {
            VC.willMove(toParent: nil)
            VC.view.removeFromSuperview()
            VC.removeFromParent()
        }
        
        VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: item)
        
        self.addChild(VC)
        VC.view.frame = contentview.bounds
        contentview.addSubview(VC.view)
        VC.didMove(toParent: self)
    }
    
    private func SelecttabIndex(selectIndex : Int) {
        
        switch selectIndex {
        
        case 0:
            GetUIViewController(item: "Item1")
            
        case 1:
            GetUIViewController(item: "Item2")
            
        case 2:
            GetUIViewController(item: "Item3")
            
        case 3:
            GetUIViewController(item: "Item4")
            
        default:
            break
        }
    }
}

extension ViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
       
        //현재탭
        tabmenuview.reloadItems(at: [IndexPath(item: selectIndex, section: 0)])
        
        //선택탭
        selectIndex = indexPath.row
        tabmenuview.reloadItems(at: [IndexPath(item: selectIndex, section: 0)])
        
        SelecttabIndex(selectIndex: selectIndex)
    }
}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return tabmenuName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabCell", for: indexPath) as! tabCell

        cell.namelabel.text = tabmenuName[indexPath.row]
        cell.namelabel.textColor = .orange
        
        cell.lineview.backgroundColor = .clear
        
        if indexPath.item == selectIndex {
            cell.isSelected = true
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        
        return cell
    }
    
    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer){
        
        if sender.direction == .left{
            
            if selectIndex+1 >= tabmenuName.count{
                return
            }
            selectIndex += 1
            
            tabmenuview.reloadItems(at: [IndexPath(item: selectIndex, section: 0)])
            tabmenuview.reloadItems(at: [IndexPath(item: selectIndex - 1, section: 0)])
            
            SelecttabIndex(selectIndex: selectIndex)
        }
        
        if sender.direction == .right{
            
            if selectIndex - 1 < 0{
                return
            }
            selectIndex -= 1
            
            tabmenuview.reloadItems(at: [IndexPath(item: selectIndex, section: 0)])
            tabmenuview.reloadItems(at: [IndexPath(item: selectIndex + 1, section: 0)])
            
            SelecttabIndex(selectIndex: selectIndex)
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / 4.0
        let height = 50
        return CGSize(width: Int(width), height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.5
    }
}
