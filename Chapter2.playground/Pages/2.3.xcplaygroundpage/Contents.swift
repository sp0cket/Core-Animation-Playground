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

//: ## 2.3 contentsScale
//: > “如果contentsScale设置为1.0，将会以每个点1个像素绘制图片，如果设置为2.0，则会以每个点2个像素绘制图片，这就是我们熟知的Retina屏幕。这并不会对我们在使用kCAGravityResizeAspect时产生任何影响，因为它就是拉伸图片以适应图层而已，根本不会考虑到分辨率问题。但是如果我们把contentsGravity设置为kCAGravityCenter（这个值并不会拉伸图片），那将会有很明显的变化 ”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
view.layer.contentsGravity = kCAGravityCenter
window

//: > “当用代码的方式来处理寄宿图的时候，一定要记住要手动的设置图层的contentsScale属性，否则，你的图片在Retina设备上就显示得不正确啦。代码如下：”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.
view.layer.contentsScale = UIScreen.main.scale
window

//: [Next](@next)
