//: # 第一章

import UIKit
import PlaygroundSupport

let window = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
PlaygroundPage.current.liveView = window
window.backgroundColor = .white

//: ## 1.3 使用图层
//: > 一个视图只有一个相关联的图层（自动创建），同时它也可以支持添加无数多个子图层。当满足以下条件的时候，你可能更需要使用`CALayer`而不是`UIView`：
//: * 开发同时可以在Mac OS上运行的跨平台应用
//: * 使用多种`CALayer`的子类（见第六章，“特殊的图层“），并且不想创建额外的`UIView`去包封装它们所有
//: * 做一些对性能特别挑剔的工作，比如对`UIView`一些可忽略不计的操作都会引起显著的不同
//:
//: 摘录来自: 钟声. “ios核心动画高级技巧”。 iBooks.

let blueLayer = CALayer()
blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
blueLayer.backgroundColor = UIColor.blue.cgColor
window.layer.addSublayer(blueLayer)
