//: # 第四章
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

//: > “单独控制每个层的圆角曲率也不是不可能的。如果想创建有些圆角有些直角的图层或视图时，你可能需要一些不同的方法。比如使用一个图层蒙板（本章稍后会讲到）或者是CAShapeLayer（见第六章『专用图层』）。”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.




//: [Next](@next)
