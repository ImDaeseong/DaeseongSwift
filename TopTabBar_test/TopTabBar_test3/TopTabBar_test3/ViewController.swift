import UIKit

protocol PagetabIndexDelegate {
    func setPage(selectIndex : Int)
}

class ViewController: UIViewController {
    
    weak var pageVC : UIPageViewControllerEx! = nil
    //weak var pageVC : UIPageViewControllerEx1! = nil
    //weak var pageVC : UIPageViewControllerEx2! = nil
    
    var delegate : PagetabIndexDelegate!

    @IBOutlet weak var contentview: UIView!
    @IBOutlet weak var tabmenuview: UICollectionView!
    
    var tabmenuName: [String] = ["tab1", "tab2", "tab3", "tab4"]
    var selectIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabmenuview.delegate = self
        tabmenuview.dataSource = self
        tabmenuview.isScrollEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeIndex(_:)), name: NSNotification.Name("changeIndex"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    @objc func changeIndex(_ sender : NotificationCenter){
        print("changeIndex")
    }
    
    public func SelecttabIndex(selectIndex : Int){
        
        let indexPath = IndexPath(item: selectIndex, section: 0)
        tabmenuview.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        
        if pageVC != nil{
            pageVC.SelectPage(index: selectIndex)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //UIPageViewControllerEx 핸들 가져오고, ViewController 핸들 넘겨주기
        if segue.identifier == "selectIndex" {
            
            pageVC = segue.destination as! UIPageViewControllerEx
            //pageVC = segue.destination as! UIPageViewControllerEx1
            //pageVC = segue.destination as! UIPageViewControllerEx2
            
            if pageVC != nil {
                pageVC.mainVC = self
                pageVC.pageDelegate = self
            }
        }
    }
    
}


extension ViewController : PagetabIndexDelegate {
    
    func setPage(selectIndex : Int){
        print("PagetabIndexDelegate:\(selectIndex)")
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
