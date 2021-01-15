import UIKit

class UIPageViewControllerEx1: UIPageViewController {
    
    weak var mainVC : ViewController! = nil
    var pageDelegate : PagetabIndexDelegate!
    var currentIndex : Int = 0
    
    lazy var itemArray : [UIViewController] = {
        return [self.GetUIViewController(boardName: "item1"), self.GetUIViewController(boardName: "item2"), self.GetUIViewController(boardName: "item3"), self.GetUIViewController(boardName: "item4")]
    }()
    
    private func GetUIViewController(boardName : String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: boardName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.delegate = self
        self.dataSource = self
        
        if let VC = itemArray.first {
            self.setViewControllers([VC], direction: .forward, animated: true, completion: nil)
        }
        
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewControllerEx1.self])
        pageControl.isHidden = true
        
    }
    
    public func SelectPage(index: Int) {
        self.setViewControllers([itemArray[index]], direction: .forward, animated: false, completion: nil)
    }
}

extension UIPageViewControllerEx1 : UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if(completed){
            
            //NotificationCenter test
            NotificationCenter.default.post(name: NSNotification.Name("changeIndex"), object: false)
            
            //delegate test
            pageDelegate.setPage(selectIndex: currentIndex)
        }
        
    }
}

extension UIPageViewControllerEx1 : UIPageViewControllerDataSource {
    
    //현재 보이는 뷰
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        if let VC = pendingViewControllers.first, let index = itemArray.index(of: VC) {
            
            if mainVC != nil {
                currentIndex = index
                mainVC.SelecttabIndex(selectIndex: currentIndex)
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard var index = itemArray.index(of: viewController) else { return nil }
        
        index -= 1
        
        guard index >= 0 else { return nil }
        
        guard itemArray.count > index else { return nil }
        
        return itemArray[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard var index = itemArray.index(of: viewController) else { return nil }
        
        index += 1
        
        guard itemArray.count != index else { return nil }
        
        guard itemArray.count > index else { return nil }
        
        return itemArray[index]
    }
    
    //페이지 수
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return itemArray.count
    }
    
    //페이지뷰 로드시 첫 페이지 index
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        return 0
    }
    
}
