import UIKit

class item6: UIViewController , UITableViewDataSource {
    
    @IBOutlet weak var tableview1: UITableView!
    
    var itemDic = [[String:String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview1.dataSource = self
        
        initData()
    }
    
    func initData(){
        
        let item1 = ["imgview": "1", "label1": "label1", "label2": "label2", "label3": "label3"]
        let item2 = ["imgview": "2", "label1": "label1", "label2": "label2", "label3": "label3"]
        let item3 = ["imgview": "3", "label1": "label1", "label2": "label2", "label3": "label3"]
        let item4 = ["imgview": "4", "label1": "label1", "label2": "label2", "label3": "label3"]
        itemDic = [item1, item2, item3, item4]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemDic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCellEx6 = tableview1.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath) as! UITableViewCellEx6
        
        let item = itemDic[indexPath.row]
        cell.imgview1.image = UIImage(named: item["imgview"]!)
        cell.label1.text = item["label1"]
        cell.label2.text = item["label2"]
        cell.label3.text = item["label3"]
        
        return cell
    }
    
}
