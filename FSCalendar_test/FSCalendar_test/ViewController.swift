
import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet weak var fscalendar: FSCalendar!
    
    private let dataformatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    }()
    
    var eventlist : [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fscalendar.allowsMultipleSelection = true
        fscalendar.swipeToChooseGesture.isEnabled = true
        fscalendar.delegate = self
        fscalendar.dataSource = self
        
        //언어
        fscalendar.locale = Locale(identifier: "ko_KR")
        
        //헤더
        fscalendar.headerHeight = 50
        fscalendar.appearance.headerMinimumDissolvedAlpha = 0.0
        fscalendar.appearance.headerDateFormat = "YYYY년 MM월"
        fscalendar.appearance.headerTitleColor = UIColor.black
        fscalendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 24)
        
        //내용
        fscalendar.appearance.weekdayTextColor = UIColor.orange
        fscalendar.appearance.todayColor = UIColor.orange
        fscalendar.appearance.todaySelectionColor = UIColor.red
        fscalendar.appearance.selectionColor = UIColor.gray
        fscalendar.appearance.eventDefaultColor = UIColor.red
        fscalendar.appearance.eventSelectionColor = UIColor.gray
        fscalendar.appearance.titleTodayColor = UIColor.yellow
        
        addevent()
    }
    
    func addevent(){
        
        eventlist.append("2020-09-01")
        eventlist.append("2020-09-15")
        eventlist.append("2020-09-30")
    }
    
    //날짜 선택시
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        //print(dataformatter.string(from: date))
    }
    
    //날짜 선택 해제시
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        //print(dataformatter.string(from: date))
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        
        let event = dataformatter.string(from: date)
        
        if self.eventlist.contains(event){
            //print(event)
            return 1
        }
        return 0
    }
}

