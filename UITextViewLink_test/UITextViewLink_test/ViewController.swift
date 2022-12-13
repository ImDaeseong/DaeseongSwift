
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        print(sourceViewController)
    }

}
