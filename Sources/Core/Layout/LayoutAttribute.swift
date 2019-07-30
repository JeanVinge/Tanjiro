//  LayoutProperty.swift
//  Tanjiro-iOS
//
//  Created by jean.vinge on 25/07/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public struct LayoutAttribute<Anchor: LayoutAnchor> {
    internal let anchor: Anchor
    internal let superViewAnchor: Anchor?
}

public extension LayoutAttribute {
    func equal(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor,
                          constant: constant).isActive = true
    }

    func greaterThanOrEqual(to otherAnchor: Anchor,
                            offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }

    func lessThanOrEqual(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor,
                          constant: constant).isActive = true
    }

    func equalToSuperView(_ constant: CGFloat = 0) {
        guard let superView = superViewAnchor else { return }
        anchor.constraint(equalTo: superView, constant: constant).isActive = true
    }

    func greaterThanOrEqualToSuperView(_ constant: CGFloat = 0) {
        guard let superView = superViewAnchor else { return }
        anchor.constraint(greaterThanOrEqualTo: superView,
                          constant: constant).isActive = true
    }

    func lessThanOrEqualToSuperView(to otherAnchor: Anchor,
                         offsetBy constant: CGFloat = 0) {
        guard let superView = superViewAnchor else { return }
        anchor.constraint(lessThanOrEqualTo: superView,
                          constant: constant).isActive = true
    }
}
