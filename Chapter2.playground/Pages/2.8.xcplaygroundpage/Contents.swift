//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
PlaygroundPage.current.liveView = window
window.backgroundColor = .white

//: ## 2.8 拼合图片
//: > “像平常一样载入我们的大图，然后把它赋值给四个独立的图层的contents，然后设置每个图层的contentsRect来去掉我们不想显示的部分。优点：拼合不仅给app提供了一个整洁的载入方式，还有效地提高了载入性能（单张大图比多张小图载入地更快）”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

func addSpriteImage(image: UIImage, rect: CGRect, layer: CALayer) {
    layer.contents = image.cgImage
    layer.contentsGravity = kCAGravityResizeAspect
    layer.contentsRect = rect
}
(0 ..< 4).forEach {
    let view = UIView(frame: CGRect(x: 100 * $0, y: 150, width: 100, height: 100))
    window.addSubview(view)
    addSpriteImage(image: #imageLiteral(resourceName: "动物.png"),
                   rect: CGRect(x: Double($0 % 2) / 2,
                                y: $0 > 1 ? 0.5 : 0,
                                width: 0.5,
                                height: 0.5),
                   layer: view.layer)
}
//: [Next](@next)
