
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datapicker1: UIDatePicker!
    
    private let dataformatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datapicker1.datePickerMode = .dateAndTime
        datapicker1.minimumDate = dataformatter.date(from : "2020-10-01 01:02:00")//최소
        datapicker1.maximumDate = dataformatter.date(from : "2020-10-10 01:02:00")//최대
    }
    
    @IBAction func DataPicker_change(_ sender: UIDatePicker) {
        
        print(dataformatter.string(from : sender.date))
    }
    
}

