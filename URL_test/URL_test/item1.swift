import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var imageview1: UIImageView!
    
    let url = "https://cdn.pixabay.com/photo/2015/07/14/18/14/school-845196_960_720.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DownloadUrl.imgDownload(imageview: imageview1, url: url)
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
