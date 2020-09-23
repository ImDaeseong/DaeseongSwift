import UIKit

class item4: UIViewController {
    
    var colors: [UIColor] = [.red, .green, .blue, .white]
    var longGesture : UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longGesture = UILongPressGestureRecognizer(target: self, action: #selector(LongGesture(gesture:)))
        longGesture.minimumPressDuration = 1
        view.addGestureRecognizer(longGesture)
    }
    
    @objc func LongGesture(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .ended {
            if let randomColor = colors.randomElement() {
                view.backgroundColor = randomColor
            }
        }
    }
}
