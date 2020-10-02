import UIKit

class item2: UIViewController {
    
    var toolbar1 : UIToolbar!
    var item1 : UIBarButtonItem!
    var item2 : UIBarButtonItem!
    var item3 : UIBarButtonItem!
    var item4 : UIBarButtonItem!
    var space : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        toolbar1 = UIToolbar(frame: CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: 40))
        toolbar1.backgroundColor = UIColor.orange
        
        let img1 = UIImage(named: "img1.png")!
        item1 = UIBarButtonItem(image: img1, style: UIBarButtonItem.Style.plain, target: self, action: #selector(item1Click(_:)))
        
        item2 = UIBarButtonItem(title: "item2", style: UIBarButtonItem.Style.plain, target: self, action: #selector(item2Click(_:)))
        
        item3 = UIBarButtonItem(title: "item3", style: UIBarButtonItem.Style.plain, target: self, action: #selector(item3Click(_:)))
        
        item4 = UIBarButtonItem(title: "item4", style: UIBarButtonItem.Style.plain, target: self, action: #selector(item4Click(_:)))
        
        space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar1.items = [item1, space, item2, space, item3, space, item4]
        self.view.addSubview(toolbar1)
    }
    
    @objc func item1Click(_ sender : Any) {
        print("item1")
    }
    
    @objc func item2Click(_ sender : Any) {
        print("item2")
    }
    
    @objc func item3Click(_ sender : Any) {
        print("item3")
    }
    
    @objc func item4Click(_ sender : UIBarButtonItem) {
        print("item4")
    }
}
