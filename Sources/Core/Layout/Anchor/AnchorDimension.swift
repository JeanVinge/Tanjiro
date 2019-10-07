//
//  AnchorDimension.swift
//  Tanjiro
//
//  Created by jean.vinge on 05/10/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public struct AnchorDimension: Anchor {
    public typealias AnchorLayout = NSLayoutDimension

    var anchor: NSLayoutDimension
    var superAnchor: NSLayoutDimension?
    var option: AnchorOption

    init(_ anchor: AnchorLayout,
         superAnchor: AnchorLayout? = nil,
         option: AnchorOption = .none) {
        self.anchor = anchor
        self.superAnchor = superAnchor
        self.option = option
    }
}

extension AnchorDimension: EqualToProtocol {

    public func equalToSuperView() {
        equalTo(anchor)
    }

    public func greaterThanOrEqualToSuperView() {
        greaterThanOrEqualTo(anchor)
    }

    public func lessThanOrEqualToSuperView() {
        lessThanOrEqualTo(anchor)
    }

    public func equalTo(_ anchor: AnchorConvertable) {
        if let anchorDimension = try? anchor.toAnchorDimension() {
            anchorDimension.constraint(equalToConstant: option.value).isActive = true
        }
    }

    public func greaterThanOrEqualTo(_ anchor: AnchorConvertable) {
        if let anchorDimension = try? anchor.toAnchorDimension() {
            anchorDimension.constraint(greaterThanOrEqualToConstant: option.value).isActive = true
        }
    }

    public func lessThanOrEqualTo(_ anchor: AnchorConvertable) {
        if let anchorDimension = try? anchor.toAnchorDimension() {
            anchorDimension.constraint(lessThanOrEqualToConstant: option.value).isActive = true
        }
    }
}
