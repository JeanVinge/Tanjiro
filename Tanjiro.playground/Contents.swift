import Tanjiro
import UIKit

let container = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 812))

let view = UIView()
    .with
    .backgroundColor(.red)
    .build()

let view2 = UIView()
    .with
    .backgroundColor(.blue)
    .build()

let label = UILabel().with
    .backgroundColor(.white)
    .font(UIFont.systemFont(ofSize: 12, weight: .heavy))
    .text("TEST")
    .build()


container.addSubview(view)
container.addSubview(view2)
view.addSubview(label)


label.layout()
    .centerY()
    .leading(.constant(10))
    .trailing(.constant(-10))
    .equalToSuperView()

view.layout()
    .top(.constant(10))
    .leading(.constant(10))
    .bottom(.constant(-10))
    .width(.constant(200))
    .equalToSuperView()

view2.layout {
    $0.top().equalTo(view.topAnchor)
    $0.trailing(.constant(-10)).equalToSuperView()
    $0.leading(.multiplier(1)).equalTo(view.trailingAnchor)
    $0.bottom().equalTo(view.bottomAnchor)
}

import PlaygroundSupport

PlaygroundPage.current.liveView = container
