//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
window.backgroundColor = .gray

PlaygroundPage.current.liveView = window

//: >“我们已经知道图层阴影并不总是方的，而是从图层内容的形状继承而来。这看上去不错，但是实时计算阴影也是一个非常消耗资源的，尤其是图层有多个子图层，每个图层还有一个有透明效果的寄宿图的时候。
//: >如果你事先知道你的阴影形状会是什么样子的，你可以通过指定一个shadowPath来提高性能。shadowPath是一个CGPathRef类型（一个指向CGPath的指针）。CGPath是一个Core Graphics对象，用来指定任意的一个矢量图形。我们可以通过这个属性单独于图层形状之外指定阴影的形状。”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

let imageView1 = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
imageView1.image = #imageLiteral(resourceName: "皮卡丘-2.png")
imageView1.layer.shadowOpacity = 0.5
let squarePath = CGMutablePath()
squarePath.addRect(imageView1.bounds)
imageView1.layer.shadowPath = squarePath
window.addSubview(imageView1)


let imageView2 = UIImageView(frame: CGRect(x: 200, y: 50, width: 100, height: 100))
imageView2.image = #imageLiteral(resourceName: "皮卡丘-2.png")
imageView2.layer.shadowOpacity = 0.5
let circlePath = CGMutablePath()
circlePath.addEllipse(in: imageView2.bounds)
imageView2.layer.shadowPath = circlePath
window.addSubview(imageView2)
//: [Next](@next)
