import UIKit

class Item2: UIViewController {

    @IBOutlet weak var circleview: CircleView!
    
    @IBOutlet weak var slider: UISlider!
    
    var TotalHour : CGFloat = 0
    var TotalMinute : CGFloat = 0
    var MyHour : CGFloat = 0
    var MyMinute : CGFloat = 0
    var Result : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleview.percent = 0
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        slider.minimumTrackTintColor = UIColor.black
        slider.maximumTrackTintColor = UIColor.gray
        slider.thumbTintColor = UIColor.orange
    }
    
    @IBAction func sliderchanged(_ sender: UISlider) {
        
        let val : Int = Int(sender.value)
        circleview.percent = val
    }
    
    @IBAction func btn_click(_ sender: Any) {
        
        //전체 시간중 현재 소요 시간에 대한 평균
        
        /*
        //총 5시간 30분
        TotalHour = 5 * 60; //5시간 * 60 분
        TotalMinute = 30; //30분

        //5시간 50분 사용
        MyHour = 5 * 60; //4시간 * 60 분
        MyMinute = 50; //50분

        Result = ((MyHour + MyMinute) / (TotalHour + TotalMinute) ) * 100
        
        if Result > 100 {
            Result = 100
        }
        circleview.percent = Int(Result)
        */
        
        /*
        //총 5시간 30분
        TotalHour = 5 * 60 // 5시간 * 60분
        TotalMinute = 30 //30분
        
        //1시간 30분 사용
        MyHour = 1 * 60 //1시간 30분
        MyMinute = 30 //30분
        
        Result = ((MyHour + MyMinute) / (TotalHour + TotalMinute) ) * 100
        circleview.percent = Int(Result)
        */
        
        //총 5시간 30분
        TotalHour = 5 * 60; //5시간 * 60 분
        TotalMinute = 30; //30분

        //4시간 50분 사용
        MyHour = 4 * 60; //4시간 * 60 분
        MyMinute = 50; //50분

        Result = ((MyHour + MyMinute) / (TotalHour + TotalMinute) ) * 100
        circleview.percent = Int(Result)
        
        //slider 
        slider.value = Float(Result)
    }
    
}
