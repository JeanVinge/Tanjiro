import Tanjiro
import UIKit

let container = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

var view = UIView()
    .with
    .backgroundColor(.red)
    .build()

var label = UILabel().with
    .backgroundColor(.white)
    .font(UIFont.systemFont(ofSize: 12, weight: .heavy))
    .text("TESTE")
    .build()


container.addSubview(view)
view.addSubview(label)

label.layout().width(.constant(10)).centerX().centerY().equalToSuperView()

view.layout()
    .top()
    .left()
    .right()
    .bottom()
    .equalToSuperView()

import PlaygroundSupport

PlaygroundPage.current.liveView = container
