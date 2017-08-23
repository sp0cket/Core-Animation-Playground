//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
window.backgroundColor = .gray

PlaygroundPage.current.liveView = window

let view1 = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
view1.backgroundColor = .white
let view1child = UIView(frame: CGRect(x: -20, y: -20, width: 50, height: 50))
view1child.backgroundColor = .red
view1.layer.cornerRadius = 20
view1.addSubview(view1child)
window.addSubview(view1)

let view2 = UIView(frame: CGRect(x: 200, y: 50, width: 100, height: 100))
view2.backgroundColor = .white
let view2child = UIView(frame: CGRect(x: -20, y: -20, width: 50, height: 50))
view2child.backgroundColor = .red
view2.layer.cornerRadius = 20
view2.layer.masksToBounds = true
view2.addSubview(view2child)
window.addSubview(view2)

//: ## 4.2 图层边框

view1.layer.borderWidth = 5
view2.layer.borderWidth = 5

//: >“仔细观察会发现边框并不会把寄宿图或子图层的形状计算进来，如果图层的子图层超过了边界，或者是寄宿图在透明区域有一个透明蒙板，边框仍然会沿着图层的边界绘制出来”
//: >“边框是跟随图层的边界变化的，而不是图层里面的内容”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

//: [Next](@next)
