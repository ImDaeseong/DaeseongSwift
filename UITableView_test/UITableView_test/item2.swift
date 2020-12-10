import UIKit

class item2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview1: UITableView!
    
    let itemArray = ["사과","라면","과자","바나나"]
    
    let cellspaceHeight : CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview1.delegate = self
        tableview1.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView()
        header.backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        let title = UILabel()
        title.textColor = UIColor.white
        title.font = UIFont.systemFont(ofSize: 15)
        title.text = "title"
        
        header.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: header.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        title.leadingAnchor.constraint(equalTo: header.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
        title.centerYAnchor.constraint(equalTo: header.layoutMarginsGuide.centerYAnchor).isActive = true
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return cellspaceHeight
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
