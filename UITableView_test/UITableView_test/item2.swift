import UIKit

class item2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
        let cell : UITableViewCell = tableview1.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        cell.detailTextLabel?.text = String(indexPath.row)
        cell.detailTextLabel?.textColor = UIColor.gray
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 2
        cell.layer.borderWidth = 1
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.layer.borderColor = UIColor.orange.cgColor
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableview1.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        print(itemArray[row])
    }
}
