import Tanjiro
import UIKit

let container = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

var view = UIView()
    .with
    .backgroundColor(.red)
    .build()

container.addSubview(view)

view.layout()
    .top()
    .left()
    .width(.constant(100))
    .height(.constant(200))
    .equalToSuperView()

import PlaygroundSupport

PlaygroundPage.current.liveView = container
