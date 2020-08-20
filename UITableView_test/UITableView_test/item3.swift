import UIKit

class item3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview1: UITableView!
    
    let itemArray = ["img1","img2","img3","img4"]

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
        
        cell.imageView?.image = UIImage(named: "img\(indexPath.row+1).png")
        cell.textLabel?.text = itemArray[indexPath.row]
        
        
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
