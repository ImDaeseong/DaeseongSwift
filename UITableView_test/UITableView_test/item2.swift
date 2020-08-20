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
        
        let cell = tableview1.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        cell.detailTextLabel?.text = String(indexPath.row)
        cell.detailTextLabel?.textColor = UIColor.orange
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableview1.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        print(itemArray[row])
    }
}
