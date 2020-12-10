import UIKit

class item1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview1: UITableView!
    
    let itemArray = ["사과","라면","과자","바나나"]
    
    let cellspaceHeight : CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 여러개 선택 가능
        //tableview1.allowsMultipleSelection = true
        
        tableview1.delegate = self
        tableview1.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //row count
        return itemArray.count
    }
    
    //상단 공간
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return cellspaceHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let head = UIView()
        head.backgroundColor = UIColor.clear
        return head
    }
    
    //하단 공간
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return cellspaceHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let head = UIView()
        head.backgroundColor = UIColor.clear
        return head
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableview1.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath) as UITableViewCell
       
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.gray
        
        cell.layer.masksToBounds = true
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectitem = itemArray[indexPath.row]
        let alart = UIAlertController(title: "선택 항목", message: selectitem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
            self.selectCellInfo()
        }
        alart.addAction(ok)
        
        self.present(alart, animated: false)
    }
    
    func selectCellInfo(){
        
        if let indexPathList = tableview1.indexPathsForSelectedRows {
            
            for indexPath in indexPathList {
                print("\(itemArray[indexPath.row])")
            }
        }
    }
    
}



