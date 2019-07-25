//
//  LayoutConstraint.swift
//  Tanjiro-iOS
//
//  Created by jean.vinge on 24/07/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public struct LayoutForDimension<Anchor: LayoutDimension> {
    internal let anchor: Anchor
}

public extension LayoutForDimension {

    func constraint(equalToConstant c: CGFloat = 0) {
        anchor.constraint(equalToConstant: c).isActive = true
    }

    func constraint(greaterThanOrEqualToConstant c: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualToConstant: c).isActive = true
    }

    func constraint(lessThanOrEqualToConstant c: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualToConstant: c).isActive = true
    }
}
