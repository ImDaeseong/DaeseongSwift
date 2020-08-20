import UIKit

class item1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview1: UITableView!
    
    let itemArray = ["사과","라면","과자","바나나"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview1.delegate = self
        tableview1.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableview1.dequeueReusableCell(withIdentifier: "itemcell") as! UITableViewCell
        
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.orange
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectitem = itemArray[indexPath.row]
        let alart = UIAlertController(title: "선택 항목", message: selectitem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { (UIAlertAction) in
        }
        alart.addAction(ok)
        self.present(alart, animated: false)
        
    }
}



