//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
window.backgroundColor = .gray

PlaygroundPage.current.liveView = window

//: ## 图层蒙版

//: >“mask图层的Color属性是无关紧要的，真正重要的是图层的轮廓。mask属性就像是一个饼干切割机，mask图层实心的部分会被保留下来，其他的则会被抛弃。（如图4.12）
//: >如果mask图层比父图层要小，只有在mask图层里面的内容才是它关心的，除此以外的一切都会被隐藏起来”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
let imageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
imageView.image = #imageLiteral(resourceName: "皮卡丘-2.png")
window.addSubview(imageView)

let maskLayer = CALayer()
maskLayer.frame = imageView.bounds
maskLayer.contents = #imageLiteral(resourceName: "条形码.png").cgImage
imageView.layer.mask = maskLayer
//: [Next](@next)
