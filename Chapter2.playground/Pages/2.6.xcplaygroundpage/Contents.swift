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
//: ## 2.6 contentsRect
//: > “contentsRect不是按点来计算的，它使用了单位坐标，单位坐标指定在0到1之间，是一个相对值（像素和点就是绝对值）。所以他们是相对与寄宿图的尺寸的。默认的contentsRect是{0, 0, 1, 1}，这意味着整个寄宿图默认都是可见的，如果我们指定一个小一点的矩形，图片就会被裁剪。”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

view.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.5, height: 0.5)
//: [Next](@next)
