//: [Previous](@previous)

import UIKit
import PlaygroundSupport
//: ## 拉伸过滤

class DigitsViewController: UIViewController {
    private var digitViews = [UIView]()
    let timer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: 0), queue: DispatchQueue(label: "com.sp0cket.Timer"))
    func initUIs() {
        view.backgroundColor = .white
        (0 ..< 6).forEach {
            let view = UIView(frame: CGRect(x: 50 + $0 * 40 + ($0 /  2) * 10, y: 50, width: 40, height: 42))
            digitViews.append(view)
            self.view.addSubview(view)
        }
        for view in digitViews {
            view.layer.contents = #imageLiteral(resourceName: "digits.png").cgImage
            view.layer.contentsGravity = kCAGravityResizeAspect
            view.layer.magnificationFilter = kCAFilterNearest
        }
    }

    override func loadView() {
        super.loadView()
        initUIs()
        timer.scheduleRepeating(deadline: .now(), interval: .seconds(1))
        timer.setEventHandler { [weak self] in
            guard let `self` = self else { return }
            func setDigit(_ digit: Int, view: UIView) {
                let index = digit == 0 ? 9 : digit - 1
                DispatchQueue.main.async {
                    view.layer.contentsRect = CGRect(x: CGFloat(index) * 0.1, y: 0, width: 0.1, height: 1)
                }
            }
            let calendar = Calendar(identifier: .chinese)
            let units: Set<Calendar.Component> = [.hour, .minute, .second]
            let components = calendar.dateComponents(units, from: Date())
            // set hours
            setDigit(components.hour! / 10, view: self.digitViews[0])
            setDigit(components.hour! % 10, view: self.digitViews[1])
            // set minutes
            setDigit(components.minute! / 10, view: self.digitViews[2])
            setDigit(components.minute! % 10, view: self.digitViews[3])
            // set seconds
            setDigit(components.second! / 10, view: self.digitViews[4])
            setDigit(components.second! % 10, view: self.digitViews[5])
        }
        timer.resume()
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = DigitsViewController()



//: [Next](@next)
