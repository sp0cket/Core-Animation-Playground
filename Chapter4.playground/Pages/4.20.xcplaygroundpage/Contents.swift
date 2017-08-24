//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
window.backgroundColor = .gray

PlaygroundPage.current.liveView = window

//: ## 组透明
//: >“当你显示一个50%透明度的图层时，图层的每个像素都会一半显示自己的颜色，另一半显示图层下面的颜色。这是正常的透明度的表现。但是如果图层包含一个同样显示50%透明的子图层时，你所看到的视图，50%来自子视图，25%来了图层本身的颜色，另外的25%则来自背景色。”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

func createButton() -> UIButton {
    let button = UIButton(frame: CGRect(origin: CGPoint(), size: CGSize(width: 150, height: 50)))
    button.backgroundColor = .white
    button.layer.cornerRadius = 10
    let label = UILabel(frame: CGRect(x: 20, y: 10, width: 110, height: 30))
    label.text = "Hello World"
    label.textAlignment = .center
    button.addSubview(label)
    return button
}

let button1 = createButton()
button1.center = CGPoint(x: 100, y: 150)
window.addSubview(button1)

let button2 = createButton()
button2.center = CGPoint(x: 300, y: 150)
button2.alpha = 0.5
window.addSubview(button2)

button2.layer.shouldRasterize = true
button2.layer.rasterizationScale = UIScreen.main.scale
