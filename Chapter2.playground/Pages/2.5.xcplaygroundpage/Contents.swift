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

view.layer.contentsGravity = kCAGravityCenter
view.layer.contentsScale = UIScreen.main.scale
window

//: ## 2.5 maskToBounds
//: > 用于决定是否显示超出边界的内容，该属性在画阴影的时候应确保设置为false
view.layer.masksToBounds = true
//: [Next](@next)
