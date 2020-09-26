import UIKit

class itemUITableViewController : UITableViewController {
    
    @IBOutlet var tableview1: UITableView!
    
    var itemlist : [itemModal] = []
    
    var mainVC: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview1.delegate = self
        
        //빈셀 않보이기
        tableview1.tableFooterView = UIView(frame: CGRect.zero)
        
        initData()
    }
    
    func initData() {
        
        var item : itemModal
        
        item = itemModal(sTitle: "title1", sDesc: "desc1", nSize: 100)
        self.itemlist.append(item)
        
        item = itemModal(sTitle: "title2", sDesc: "desc2", nSize: 200)
        self.itemlist.append(item)
        
        item = itemModal(sTitle: "title3", sDesc: "desc3", nSize: 300)
        self.itemlist.append(item)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) ->
        String? {
            return "item 선택하세요"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemlist.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectitem = self.itemlist[indexPath.row]
        //print(selectitem.sTitle!)
        //print(selectitem.sDesc!)
        //print(selectitem.nSize!)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath)
        cell.textLabel?.text = self.itemlist[indexPath.row].sTitle
        
        return cell
    }
    
}
