import UIKit

class item5: UIViewController, UITableViewDelegate, UITableViewDataSource, itemcell2Delegate  {
    
    @IBOutlet weak var tableview1: UITableView!
    
    var itemArray : [itemcell2]!
    
    var cellHeight : CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemArray = [
            itemcell2(imgview1: "img1", label1: "img1", label2: "img1"),
            itemcell2(imgview1: "img2", label1: "img2", label2: "img2"),
            itemcell2(imgview1: "img3", label1: "img3", label2: "img3"),
            itemcell2(imgview1: "img4", label1: "img4", label2: "img4"),
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCellEx2 = tableview1.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath) as! UITableViewCellEx2
        
        let item = itemArray[indexPath.row]
        cell.imgview1.image = UIImage(named: item.imgview1)
        cell.label1.text = item.label1
        cell.label2.text = item.label2
        cell.itemcell2 = item
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let selectitem = itemArray[indexPath.row] as? itemcell2 else  { return }
            
        print("selectitem.imgview1:" + selectitem.imgview1)
        print("selectitem.label1:" + selectitem.label1)
        print("selectitem.label2:" + selectitem.label2)
    }
    
    //row 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //return cellHeight
        
        let count = itemArray.count
    
        let Height = CGFloat(tableView.bounds.height / CGFloat(count))
    
        return Height
    }
    
    func selectCell(item : itemcell2){
        
        print("itemcell2Delegate:" + item.label1)
        print("itemcell2Delegate:" + item.label2)
    }
}
