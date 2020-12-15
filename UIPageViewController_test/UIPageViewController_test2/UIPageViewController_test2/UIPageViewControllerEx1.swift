
import UIKit

class UIPageViewControllerEx1: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    lazy var itemArray : [UIViewController] = {
        return [self.GetUIViewController(boardName: "item1"), self.GetUIViewController(boardName: "item2"), self.GetUIViewController(boardName: "item3")]
    }()
    
    private func GetUIViewController(boardName : String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: boardName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        self.view.backgroundColor = UIColor.white
        
        if let VC = itemArray.first {
            setViewControllers([VC], direction: .forward, animated: true, completion: nil)
        }
        
        UIPageControl.appearance().numberOfPages = itemArray.count
        
        //UIPageControl.appearance().backgroundColor = UIColor.white
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.orange
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        if let VC = pendingViewControllers.first, let index = itemArray.index(of: VC) {
            
            print("index:\(index)")
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard var index = itemArray.index(of: viewController) else { return nil }
        
        index -= 1
        
        guard index >= 0 else { return itemArray.last }
        
        return itemArray[index]
        
        
        /*
        guard let index = itemArray.index(of: viewController) else {
            return nil
        }

        let previousIndex = index - 1

        guard previousIndex >= 0 else {
            return nil
        }

        guard itemArray.count > previousIndex else {
            return nil
        }

        return itemArray[previousIndex]
        */
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard var index = itemArray.index(of: viewController) else { return nil }
        
        index += 1
        
        guard index < itemArray.count else { return itemArray.first }
        
        return itemArray[index]
        
        
        /*
        guard let index = itemArray.index(of: viewController) else {
            return nil
        }

        let nextIndex = index + 1

        guard itemArray.count != nextIndex else {
            return nil
        }

        guard itemArray.count > nextIndex else {
            return nil
        }

        return itemArray[nextIndex]
        */
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard completed else { return }
        
        print(completed)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return itemArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let VC = viewControllers?.first, let index = itemArray.index(of: VC) else { return 0 }
        
        return index
    }
}


