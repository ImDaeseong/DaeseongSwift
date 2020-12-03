import UIKit

class item4: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview1: UITableView!
   
    var itemArray : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview1.delegate = self
        tableview1.dataSource = self
        
        itemArray = ["img1","img2","img3","img4"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview1.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath) as! UITableViewCellEx1
        
        cell.imgview1.image = UIImage(named: itemArray[indexPath.row])
        cell.label1.text = itemArray[indexPath.row]
        
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
