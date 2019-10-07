//
//  AnchorX.swift
//  Tanjiro
//
//  Created by jean.vinge on 05/10/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public struct AnchorX: Anchor {
    public typealias AnchorLayout = NSLayoutXAxisAnchor

    var anchor: NSLayoutXAxisAnchor
    var superAnchor: NSLayoutXAxisAnchor?
    var option: AnchorOption

    init(_ anchor: AnchorLayout,
         superAnchor: AnchorLayout?,
         option: AnchorOption = .none) {
        self.anchor = anchor
        self.superAnchor = superAnchor
        self.option = option
    }
}

extension AnchorX: EqualToProtocol {
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
        if let anchorX = try? anchor.toAnchorX() {
            anchorX.constraint(equalTo: anchorX,
                               constant: option.value).isActive = true
        }
    }

    public func greaterThanOrEqualTo(_ anchor: AnchorConvertable) {
        if let anchorX = try? anchor.toAnchorX() {
            anchorX.constraint(greaterThanOrEqualTo: anchorX,
                              constant: option.value).isActive = true
        }
    }

    public func lessThanOrEqualTo(_ anchor: AnchorConvertable) {
        if let anchorX = try? anchor.toAnchorX() {
            anchorX.constraint(lessThanOrEqualTo: anchorX,
                               constant: option.value).isActive = true
        }
    }
}
