//
//  Anchor.swift
//  Tanjiro
//
//  Created by jean.vinge on 04/10/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

protocol Anchor {
    associatedtype AnchorLayout = Void
    var anchor: AnchorLayout { get }
    var superAnchor: AnchorLayout? { get }
    var option: AnchorOption { get set }
}

public enum AnchorOption {
    case inset(CGFloat)
    case offset(CGFloat)
    case multiplier(CGFloat)
    case constant(CGFloat)
    case none

    var value: CGFloat {
        switch self {
        case let .inset(value),
             let .offset(value),
             let .multiplier(value),
             let .constant(value):
            return value
        case .none: return 0
        }
    }
}
