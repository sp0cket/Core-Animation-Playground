//: # 第三章

import UIKit
import PlaygroundSupport


class ClockViewController: UIViewController {
    var hourHand: UIImageView!
    var minuteHand: UIImageView!
    var secondHand: UIImageView!
    func initUIs() {
        let _: UIImageView = {
            $0.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            $0.image = #imageLiteral(resourceName: "表盘.png")
            view.addSubview($0)
            return $0
        }(UIImageView())
        hourHand = {
            $0.frame = CGRect(x: 190, y: 120, width: 20, height: 160)
            $0.image = #imageLiteral(resourceName: "分针.png")
            $0.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
            view.addSubview($0)
            return $0
        }(UIImageView())
        minuteHand = {
            $0.frame = CGRect(x: 190, y: 110, width: 20, height: 180)
            $0.image = #imageLiteral(resourceName: "时针.png")
            $0.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
            view.addSubview($0)
            return $0
        }(UIImageView())
        secondHand = {
            $0.frame = CGRect(x: 195, y: 110, width: 10, height: 180)
            $0.image = #imageLiteral(resourceName: "秒针.png")
            $0.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
            view.addSubview($0)
            return $0
        }(UIImageView())
    }
    let timer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: 0), queue: DispatchQueue(label: "com.sp0cket.Timer"))
    override func loadView() {
        super.loadView()
        initUIs()
        timer.scheduleRepeating(deadline: .now(), interval: .seconds(1))
        timer.setEventHandler { [weak self] in
            guard let `self` = self else { return }
            let calendar = Calendar(identifier: .chinese)
            let units: Set<Calendar.Component> = [.hour, .minute, .second]
            let components = calendar.dateComponents(units, from: Date())
            let hoursAngle = CGFloat(components.hour!) / 12 * CGFloat.pi * 2
            let minsAngle = CGFloat(components.minute!) / 60 * CGFloat.pi * 2
            let secsAngle = CGFloat(components.second!) / 60 * CGFloat.pi * 2
            DispatchQueue.main.async {
                self.hourHand.transform = CGAffineTransform(rotationAngle: hoursAngle)
                self.minuteHand.transform = CGAffineTransform(rotationAngle: minsAngle)
                self.secondHand.transform = CGAffineTransform(rotationAngle: secsAngle)
            }
        }
        timer.resume()
    }
}
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = ClockViewController()

//: [Next](@next)
