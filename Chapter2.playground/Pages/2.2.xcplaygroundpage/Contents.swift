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

//: ## 2.2 contentsGravity
//: > 我们的图片并不刚好是一个方的，为了适应这个视图，加载的图片被挤扁了。在使用`UIImageView的时候遇到过同样的问题，解决方法就是把contentMode属性设置成更合适的值，像这样：
//: ```
//: view.contentMode = .scaleAspectFit
//: ```
//view.contentMode = .scaleAspectFit
window
//: > 这个方法基本和我们遇到的情况的解决方法已经接近了（你可以试一下 :) ），不过UIView大多数视觉相关的属性比如contentMode，对这些属性的操作其实是对对应图层的操作。
//: CALayer与contentMode对应的属性叫做contentsGravity，但是它是一个String类型，而不是像对应的UIKit部分，那里面的值是枚举。contentsGravity可选的常量值有以下一些：
//: * kCAGravityCenter
//: * kCAGravityTop
//: * kCAGravityBottom
//: * kCAGravityLeft
//: * kCAGravityRight
//: * kCAGravityTopLeft
//: * kCAGravityTopRight
//: * kCAGravityBottomLeft
//: * kCAGravityBottomRigh
//: * kCAGravityResize
//: * kCAGravityResizeAspect
//: * kCAGravityResizeAspectFill
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
view.layer.contentsGravity = kCAGravityResizeAspectFill

//: [Next](@next)
