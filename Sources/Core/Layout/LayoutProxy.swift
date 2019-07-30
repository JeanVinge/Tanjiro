//  LayoutProxy.swift
//  Tanjiro-iOS
//
//  Created by jean.vinge on 25/07/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

enum LayoutConstraint {
    case left
    case right
    case top
    case bottom
    case leading
    case trailing
    case centerX
    case centerY
}

public class LayoutProxy {
    public lazy var left = property(with: view.leftAnchor, side: .left)
    public lazy var right = property(with: view.rightAnchor, side: .right)
    public lazy var leading = property(with: view.leadingAnchor, side: .leading)
    public lazy var trailing = property(with: view.trailingAnchor, side: .trailing)
    public lazy var top = property(with: view.topAnchor, side: .top)
    public lazy var bottom = property(with: view.bottomAnchor, side: .bottom)
    public lazy var width = dimension(with: view.widthAnchor)
    public lazy var height = dimension(with: view.heightAnchor)
    public lazy var centerX = property(with: view.centerXAnchor, side: .centerX)
    public lazy var centerY = property(with: view.centerYAnchor, side: .centerY)

    private let view: UIView

    fileprivate init(view: UIView) {
        self.view = view
    }

    private func property<A: LayoutAnchor>(with anchor: A, side: LayoutConstraint) -> LayoutAttribute<A> {
        return LayoutAttribute(anchor: anchor,
                               superViewAnchor: superAnchor(side))
    }

    private func dimension<A: LayoutDimension>(with anchor: A) -> LayoutForDimension<A> {
        return LayoutForDimension(anchor: anchor)
    }

    private func superAnchor<A: LayoutAnchor>(_ side: LayoutConstraint) -> A? {
        guard let superView = view.superview else { return nil }
        switch side {
        case .left:
            return superView.leftAnchor as? A
        case .right:
            return superView.rightAnchor as? A
        case .leading:
            return superView.leadingAnchor as? A
        case .trailing:
            return superView.trailingAnchor as? A
        case .bottom:
            return superView.bottomAnchor as? A
        case .centerX:
            return superView.centerXAnchor as? A
        case .centerY:
            return superView.centerYAnchor as? A
        case .top:
            return superView.topAnchor as? A
        }
    }
}

public extension UIView {
    func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
}
