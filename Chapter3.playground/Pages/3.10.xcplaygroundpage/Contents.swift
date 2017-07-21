//: [Previous](@previous)

import UIKit
import PlaygroundSupport

class CustomViewController: UIViewController {
    let layerView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    let blueLayer = CALayer()
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        layerView.backgroundColor = .green
        view.addSubview(layerView)
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(blueLayer)
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        var point = touches.first!.location(in: view)
//        point = layerView.layer.convert(point, from: view.layer)
//        if layerView.layer.contains(point) {
//            point = blueLayer.convert(point, from: layerView.layer)
//            if blueLayer.contains(point) {
//                print("Inside Blue Layer")
//            } else {
//                print("Inside Green View")
//            }
//        }
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first!.location(in: view)
        let layer = layerView.layer.hitTest(point)
        if layer == blueLayer {
            print("Inside Blue Layer")
        } else if layer == layerView.layer {
            print("Inside Green Layer")
        }
    }
}

//: > “注意当调用图层的-hitTest:方法时，测算的顺序严格依赖于图层树当中的图层顺序（和UIView处理事件类似）。之前提到的zPosition属性可以明显改变屏幕上图层的顺序，但不能改变事件传递的顺序。这意味着如果改变了图层的z轴顺序，你会发现将不能够检测到最前方的视图点击事件，这是因为被另一个图层遮盖住了，虽然它的zPosition值较小，但是在图层树中的顺序靠前。我们将在第五章详细讨论这个问题。
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

PlaygroundPage.current.liveView = CustomViewController()
