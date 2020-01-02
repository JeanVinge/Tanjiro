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
    
    public func equalTo(_ anchor: AnchorConvertible) {
        switch option {
        case .constant, .none:
            self.anchor.constraint(equalTo: anchorX(anchor),
                                   constant: option.value).isActive = true
        case let .multiplier(multiplier):
            self.anchor.constraint(equalToSystemSpacingAfter: anchorX(anchor), multiplier: multiplier).isActive = true
        }
    }
    
    public func greaterThanOrEqualTo(_ anchor: AnchorConvertible) {
        switch option {
        case .constant, .none:
            self.anchor.constraint(greaterThanOrEqualTo: anchorX(anchor),
                                   constant: option.value).isActive = true
        case let .multiplier(multiplier):
            self.anchor.constraint(greaterThanOrEqualToSystemSpacingAfter: anchorX(anchor), multiplier: multiplier).isActive = true
        }
    }
    
    public func lessThanOrEqualTo(_ anchor: AnchorConvertible) {
        switch option {
        case .constant, .none:
            self.anchor.constraint(lessThanOrEqualTo: anchorX(anchor),
                                   constant: option.value).isActive = true
        case let .multiplier(multiplier):
            self.anchor.constraint(lessThanOrEqualToSystemSpacingAfter: anchorX(anchor), multiplier: multiplier).isActive = true
        }
    }
    
    // MARK: Helpers
    
    private func anchorX(_ anchor: AnchorConvertible) -> NSLayoutXAxisAnchor {
        do {
            return try anchor.toAnchorX()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
