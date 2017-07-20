//: # 第二章 寄宿图
import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
PlaygroundPage.current.liveView = window
window.backgroundColor = .white

let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
view.backgroundColor = .blue
window.addSubview(view)

//: ## 2.1 contents属性
//: > “CALayer 有一个属性叫做contents，这个属性的类型被定义为id，意味着它可以是任何类型的对象。在这种情况下，你可以给contents属性赋任何值，你的app仍然能够编译通过。但是，在实践中，如果你给contents赋的不是CGImage，那么你得到的图层将是空白的。”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
view.layer.contents = #imageLiteral(resourceName: "flower.jpg").cgImage
//view.layer.contents = #imageLiteral(resourceName: "flower.jpg")

//: [Next](@next)
