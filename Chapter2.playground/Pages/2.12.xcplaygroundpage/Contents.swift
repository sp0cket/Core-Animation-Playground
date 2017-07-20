//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 400, height: 400)))
PlaygroundPage.current.liveView = window
window.backgroundColor = .white

//: ## Custom Drawing
//: > “给contents赋CGImage的值不是唯一的设置寄宿图的方法。我们也可以直接用Core Graphics直接绘制寄宿图。能够通过继承UIView并实现draw(_ rect: CGRect)方法来自定义绘制。
//: draw(_ rect: CGRect)方法没有默认的实现，因为对UIView来说，寄宿图并不是必须的，它不在意那到底是单调的颜色还是有一个图片的实例。如果UIView检测到draw(_ rect: CGRect)方法被调用了，它就会为视图分配一个寄宿图，这个寄宿图的像素尺寸等于视图大小乘以 contentsScale的值。
//: 如果你不需要寄宿图，那就不要创建这个方法了，这会造成CPU资源和内存的浪费，这也是为什么苹果建议：如果没有自定义绘制的任务就不要在子类中写一个空的draw(_ rect: CGRect)方法。
//: 当视图在屏幕上出现的时候draw(_ rect: CGRect)方法就会被自动调用。draw(_ rect: CGRect)方法里面的代码利用Core Graphics去绘制一个寄宿图，然后内容就会被缓存起来直到它需要被更新（通常是因为开发者调用了setNeedsDisplay()方法，尽管影响到表现效果的属性值被更改时，一些视图类型会被自动重绘，如bounds属性）。虽然draw(_ rect: CGRect)方法是一个UIView方法，事实上都是底层的CALayer安排了重绘工作和保存了因此产生的图片。
//: CALayer有一个可选的delegate属性，实现了CALayerDelegate协议，当CALayer需要一个内容特定的信息时，就会从协议中请求。CALayerDelegate是一个非正式协议，其实就是说没有CALayerDelegate可以让你在类里面引用啦。你只需要调用你想调用的方法，CALayer会帮你做剩下的。（delegate属性被声明为id类型，所有的代理方法都是可选的）。
//: 当需要被重绘时，CALayer会请求它的代理给他一个寄宿图来显示。它通过调用下面这个方法做到的:”
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

class CustomViewController: UIViewController, CALayerDelegate {
    override func loadView() {
        super.loadView()
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.contentsScale = UIScreen.main.scale
        blueLayer.delegate = self
        view.layer.addSublayer(blueLayer)
        blueLayer.display()
    }
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}
let view = CustomViewController().view
window.addSubview(view!)

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(blueLayer)
        blueLayer.display()
    }
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(10)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.white.cgColor)
        context.fill(rect)
        context.strokeEllipse(in: rect)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
let customView = CustomView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
window.addSubview(customView)

//: >注意一下一些有趣的事情：
//: * 我们在blueLayer上显式地调用了display()。不同于UIView，当图层显示在屏幕上时，CALayer不会自动重绘它的内容。它把重绘的决定权交给了开发者。
//: * 尽管我们没有用`masksToBounds`属性，绘制的那个圆仍然沿边界被裁剪了。这是因为当你使用CALayerDelegate绘制寄宿图的时候，并没有对超出边界外的内容提供绘制支持。
//: >现在你理解了CALayerDelegate，并知道怎么使用它。但是除非你创建了一个单独的图层，你几乎没有机会用到CALayerDelegate协议。因为当UIView创建了它的宿主图层时，它就会自动地把图层的delegate设置为它自己，并提供了一个-displayLayer:的实现，那所有的问题就都没了。
//: >当使用寄宿了视图的图层的时候，你也不必实现display(_ layer: CALayer)和draw(_ layer: CALayer, in ctx: CGContext)方法来绘制你的寄宿图。通常做法是实现UIView的draw(_ rect: CGRect)方法，UIView就会帮你做完剩下的工作，包括在需要重绘的时候调用display()方法。
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

//: [Next](@next)
