//
//  AnchorY.swift
//  Tanjiro
//
//  Created by jean.vinge on 05/10/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public struct AnchorY: Anchor {
    public typealias AnchorLayout = NSLayoutYAxisAnchor

    var anchor: NSLayoutYAxisAnchor
    var superAnchor: NSLayoutYAxisAnchor?
    var option: AnchorOption

    init(_ anchor: AnchorLayout,
         superAnchor: AnchorLayout?,
         option: AnchorOption = .none) {
        self.anchor = anchor
        self.superAnchor = superAnchor
        self.option = option
    }
}

extension AnchorY: EqualToProtocol {
    public func equalToSuperView() {
        guard let superAnchor = superAnchor else { return }
        equalTo(superAnchor)
    }

    public func greaterThanOrEqualToSuperView() {
        guard let superAnchor = superAnchor else { return }
        greaterThanOrEqualTo(superAnchor)
    }

    public func lessThanOrEqualToSuperView() {
        guard let superAnchor = superAnchor else { return }
        lessThanOrEqualTo(superAnchor)
    }

    public func equalTo(_ anchor: AnchorConvertable) {
        if let anchorY = try? anchor.toAnchorY() {
            anchorY.constraint(equalTo: anchorY,
                               constant: option.value).isActive = true
        }
    }

    public func greaterThanOrEqualTo(_ anchor: AnchorConvertable) {
        if let anchorY = try? anchor.toAnchorY() {
            anchorY.constraint(greaterThanOrEqualTo: anchorY,
                               constant: option.value).isActive = true
        }
    }

    public func lessThanOrEqualTo(_ anchor: AnchorConvertable) {
        if let anchorY = try? anchor.toAnchorY() {
            anchorY.constraint(lessThanOrEqualTo: anchorY,
                               constant: option.value).isActive = true
        }
    }
}
