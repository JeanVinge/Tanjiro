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
    
    public func equalTo(_ anchor: AnchorConvertible) {
        switch option {
        case .constant, .none:
            self.anchor.constraint(equalTo: anchorY(anchor),
                                   constant: option.value).isActive = true
        case let .multiplier(multiplier):
            self.anchor.constraint(equalToSystemSpacingBelow: anchorY(anchor),
                                   multiplier: multiplier).isActive = true
        }
    }
    
    public func greaterThanOrEqualTo(_ anchor: AnchorConvertible) {
        switch option {
        case .constant, .none:
            self.anchor.constraint(greaterThanOrEqualTo: anchorY(anchor),
                                   constant: option.value).isActive = true
        case let .multiplier(multiplier):
            self.anchor.constraint(greaterThanOrEqualToSystemSpacingBelow: anchorY(anchor),
                                   multiplier: multiplier).isActive = true
        }
    }
    
    public func lessThanOrEqualTo(_ anchor: AnchorConvertible) {
        switch option {
        case .constant, .none:
            self.anchor.constraint(lessThanOrEqualTo: anchorY(anchor),
                                   constant: option.value).isActive = true
        case let .multiplier(multiplier):
            self.anchor.constraint(lessThanOrEqualToSystemSpacingBelow: anchorY(anchor),
                                   multiplier: multiplier).isActive = true
        }
    }
    
    // MARK: Helpers
    
    private func anchorY(_ anchor: AnchorConvertible) -> NSLayoutYAxisAnchor {
        do {
            return try anchor.toAnchorY()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
