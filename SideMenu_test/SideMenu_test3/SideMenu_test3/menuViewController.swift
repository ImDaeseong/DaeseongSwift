
import UIKit

class menuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func menu1_click(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainhome = storyBoard.instantiateViewController(withIdentifier: "tab1ViewController") as! tab1ViewController
        self.present(mainhome, animated:true, completion:nil)
    }
    
    @IBAction func menu2_click(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainhome = storyBoard.instantiateViewController(withIdentifier: "tab2ViewController") as! tab2ViewController
        self.present(mainhome, animated:true, completion:nil)
    }
    
    @IBAction func menu3_click(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainhome = storyBoard.instantiateViewController(withIdentifier: "tab3ViewController") as! tab3ViewController
        self.present(mainhome, animated:true, completion:nil)
    }
}
