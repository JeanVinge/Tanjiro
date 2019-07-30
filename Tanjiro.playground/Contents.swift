import Tanjiro
import UIKit

let container = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))

var view = UIView().with {
    $0.backgroundColor = .green
}

container.addSubview(view)

view.layout {
    $0.centerX.equalToSuperView()
    $0.centerY.equalToSuperView()
    $0.width.constraint(equalToConstant: 30)
    $0.height.constraint(lessThanOrEqualToConstant: 30)
}

import PlaygroundSupport

PlaygroundPage.current.liveView = container

