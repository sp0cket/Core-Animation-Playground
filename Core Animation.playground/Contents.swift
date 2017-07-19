//: # 第一章

import UIKit
import PlaygroundSupport

let backView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
PlaygroundPage.current.liveView = backView
backView.backgroundColor = .white

//: > 1.3 使用图层
let blueLayer = CALayer()
blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
blueLayer.backgroundColor = UIColor.blue.cgColor
backView.layer.addSublayer(blueLayer)