
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgview1: UIImageView!
    
    var imgPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPicker.delegate = self
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        /*
        self.imgPicker.sourceType = .photoLibrary
        self.present(self.imgPicker, animated: true,  completion: nil)
        */
        
        
        let alertController = UIAlertController(title: "선택", message: "이미지 선택", preferredStyle: .actionSheet)
        
        let alertCamera = UIAlertAction(title: "Camera", style: .default, handler: { (UIAlertAction) in
            
            //카메라 선택
            self.selectCamera()
        })
        
        let alertGallery = UIAlertAction(title: "Gallery", style: .default, handler: { (UIAlertAction) in
            
            //이미지 폴더 선택
            self.selectGallery()
        })
        
        alertController.addAction(alertCamera)
        alertController.addAction(alertGallery)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func selectCamera() {
        
        if ( UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            
            imgPicker.sourceType = UIImagePickerController.SourceType.camera
            imgPicker.allowsEditing = true
            imgPicker.showsCameraControls = true
            self.present(imgPicker, animated: true, completion: nil)
        
        } else {
            
            let alert  = UIAlertController(title: "", message: "카메라 사용권한이 없습니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func selectGallery() {
        
        imgPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imgPicker.allowsEditing = true
        //imgPicker.allowsEditing = false
        self.present(imgPicker, animated: true, completion: nil)
    }
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //선택
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
        if let imgedit = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            self.imgview1.image = imgedit
            
        } else if let img: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            self.imgview1.image = img
        }
       
        
        dismiss(animated: true, completion: nil)
    }
    
    //취소
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
