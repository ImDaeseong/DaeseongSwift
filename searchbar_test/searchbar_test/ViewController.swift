
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var textfield: TextFieldEx!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.delegate = self
        
        searchbar.delegate = self
        searchbar.searchBarStyle = UISearchBar.Style.minimal
        searchbar.tintColor = UIColor.orange
        searchbar.backgroundColor = UIColor.clear
        searchbar.placeholder = "버스 번호를 입력해주세요."
    }
    
    @IBAction func search_click(_ sender: ButtonEx) {
        
        print(self.textfield.text!)
        
        self.textfield.resignFirstResponder()
        self.textfield.text = ""
    }
    
}

extension ViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text!.count > 0 {
            
            print(searchBar.text!)
        }
        
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        //print("텍스트 입력 상태를 시작해도 되는지 물음")
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        //print("텍스트 입력 상태를 종료해도 되는지 물음")
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        //print("textfield 입력시작")
        
        self.textfield.setborderColor(bFocus : true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //print("textfield 입력종료")
        
        self.textfield.setborderColor(bFocus : false)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //print("텍스트 입력값이 변경 될때 호출 \(string)")
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //print("textfield 리턴키 클릭시\(textField.tag)")
        
        textField.resignFirstResponder()
        
        return true
    }
}
