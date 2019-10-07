//
//  AnchorFactory.swift
//  Tanjiro
//
//  Created by jean.vinge on 07/10/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

enum AnchorType {
    case left
    case right
    case leading
    case trailing
    case bottom
    case top
    case centerX
    case centerY
    case height
    case width
}

struct AnchorFactory {
    static func build(_ type: AnchorType,
                      view: UIView,
                      option: AnchorOption = .none) -> EqualToProtocol {
        switch type {
        case .left:
            return AnchorX(view.leftAnchor,
                           superAnchor: view.superview?.leftAnchor,
                           option: option)
        case .right:
            return AnchorX(view.rightAnchor,
                           superAnchor: view.superview?.rightAnchor,
                           option: option)
        case .leading:
            return AnchorX(view.leadingAnchor,
                           superAnchor: view.superview?.leadingAnchor,
                           option: option)
        case .trailing:
            return AnchorX(view.trailingAnchor,
                           superAnchor: view.superview?.trailingAnchor,
                           option: option)
        case .bottom:
            return AnchorY(view.bottomAnchor,
                           superAnchor: view.superview?.bottomAnchor,
                           option: option)
        case .top:
            return AnchorY(view.topAnchor,
                           superAnchor: view.superview?.topAnchor,
                           option: option)
        case .centerX:
            return AnchorX(view.centerXAnchor,
                           superAnchor: view.superview?.centerXAnchor,
                           option: option)
        case .centerY:
            return AnchorY(view.centerYAnchor,
                           superAnchor: view.superview?.centerYAnchor,
                           option: option)
        case .height:
            return AnchorDimension(view.heightAnchor,
                                   superAnchor: view.superview?.heightAnchor,
                                   option: option)
        case .width:
            return AnchorDimension(view.widthAnchor,
                                   superAnchor: view.superview?.widthAnchor,
                                   option: option)
        }
    }
}
