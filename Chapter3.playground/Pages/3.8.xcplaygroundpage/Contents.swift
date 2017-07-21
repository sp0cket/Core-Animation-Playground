//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
PlaygroundPage.current.liveView = window
window.backgroundColor = .white

let greenLayer = CALayer()
greenLayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
greenLayer.backgroundColor = UIColor.green.cgColor
window.layer.addSublayer(greenLayer)

let redLayer = CALayer()
redLayer.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
redLayer.backgroundColor = UIColor.red.cgColor
window.layer.addSublayer(redLayer)
window

//: ## 3.9 zPosition
//: > “我们希望在真实的应用中也能显示出绘图的顺序，同样地，如果我们提高绿色视图的zPosition，我们会发现顺序就反了。其实并不需要增加太多，视图都非常地薄，所以给zPosition提高一个像素就可以让绿色视图前置，当然0.1或者0.0001也能够做到，但是最好不要这样，因为浮点类型四舍五入的计算可能会造成一些不便的麻烦。”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
greenLayer.zPosition = 1

//: [Next](@next)