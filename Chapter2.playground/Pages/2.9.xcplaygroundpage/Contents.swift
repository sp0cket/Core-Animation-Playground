//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
PlaygroundPage.current.liveView = window
window.backgroundColor = .white

let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
view.backgroundColor = .blue
window.addSubview(view)

view.layer.contents = #imageLiteral(resourceName: "flower.jpg").cgImage
window

//: ## 2.9 constentsCenter
//: > “本章我们介绍的最后一个和内容有关的属性是contentsCenter，看名字你可能会以为它可能跟图片的位置有关，不过这名字着实误导了你。contentsCenter其实是一个CGRect，它定义了一个固定的边框和一个在图层上可拉伸的区域。 改变contentsCenter的值并不会影响到寄宿图的显示，除非这个图层的大小改变了，你才看得到效果。”
//:
//:摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
//view.layer.contentsCenter = CGRect(x: 0, y: 0, width: 1.5, height: 1.5)
view.layer.contentsCenter = CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5)

//: [Next](@next)
