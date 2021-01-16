import UIKit

class CircleView : UIView {
    
    let linewidth : CGFloat = 10.0
    
    var percent : Int = 0 {
        didSet {
            self.txtlabel.text = "\(percent) %"
            self.setNeedsDisplay()
        }
    }
    
    let txtlabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.orange
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initcontrol()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initcontrol()
    }
    
    override func draw(_ rect: CGRect) {
        
        let context : CGContext = UIGraphicsGetCurrentContext()!
        
        let startAngle : CGFloat = -.pi/2.0
        let endAngle : CGFloat = startAngle + CGFloat(Double(percent) / 100.0) * .pi * 2.0
        
        //print("startAngle:\(startAngle)")
        //print("endAngle:\(endAngle)")
        
        
        //전체 원그리기
        context.setFillColor(UIColor.clear.cgColor)
        context.addEllipse(in: rect)
        context.fillPath()//컨텍스트 draw
        
        
        //전체 테두리 라인 그리기
        context.setLineWidth(linewidth)//선 두께 설정
        context.setStrokeColor(UIColor.gray.cgColor)//선 색상 설정
        context.addEllipse(in: rect.insetBy(dx: linewidth / 2.0, dy: linewidth / 2.0))
        context.strokePath()//컨텍스트 draw
        
        
        //percent 테두리 라인 그리기
        context.setStrokeColor(UIColor.orange.cgColor)//percent 선 색상 설정
        context.setLineCap(.round)//시작점과 끝점사이에 라운드 스타일
        context.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: (rect.midX - linewidth / 2.0), startAngle: startAngle, endAngle: endAngle, clockwise: false)
        context.strokePath()//컨텍스트 draw
        
        //print("rect.midX:\(rect.midX)")
        //print("rect.midY:\(rect.midY)")
        //print("(rect.midX - linewidth / 2.0):\(rect.midX - linewidth / 2.0)")
    }
    
    func initcontrol(){
        
        self.addSubview(txtlabel)
        
        txtlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        txtlabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

