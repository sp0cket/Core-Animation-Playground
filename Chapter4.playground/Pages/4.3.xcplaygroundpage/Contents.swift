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

//: ## 4.3 阴影

//: >“和图层边框不同，图层的阴影继承自内容的外形，而不是根据边界和角半径来确定。为了计算出阴影的形状，Core Animation会将寄宿图”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

let imageView = UIImageView(frame: CGRect(x: 50, y: 200, width: 100, height: 100))
imageView.image = #imageLiteral(resourceName: "皮卡丘-2.png")
imageView.layer.shadowOpacity = 1
window.addSubview(imageView)

//: >“maskToBounds属性裁剪掉了阴影和内容，从技术角度来说，这个结果是可以是可以理解的，但确实又不是我们想要的效果。如果你想沿着内容裁切，你需要用到两个图层：一个只画阴影的空的外图层，和一个用masksToBounds裁剪内容的内图层。
//: >如果我们把之前项目的右边用单独的视图把裁剪的视图包起来，我们就可以解决这个问题”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
view1.layer.shadowOpacity = 1
view2.layer.shadowOpacity = 1

//: [Next](@next)
