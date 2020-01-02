//  LayoutBuilder.swift
//  Tanjiro-iOS
//
//  Created by jean.vinge on 25/07/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public class LayoutBuilder {

    // MARK: Var

    private var anchors: [EqualToProtocol] = []

    private let view: UIView

    // MARK: Init

    init(_ view: UIView, anchors: [EqualToProtocol] = []) {
        self.view = view
        self.anchors = anchors
    }

    public func left(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .left, option: option)
    }

    public func leading(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .leading, option: option)
    }

    public func right(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .right, option: option)
    }

    public func trailing(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .trailing, option: option)
    }

    public func top(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .top, option: option)
    }

    public func bottom(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .bottom, option: option)
    }

    public func centerX(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .centerX, option: option)
    }

    public func centerY(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .centerY, option: option)
    }

    public func width(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .width, option: option)
    }

    public func height(_ option: AnchorOption = .none) -> LayoutBuilder {
        return create(anchor: .height, option: option)
    }
    
    // MARK: Helpers
    
    private func create(anchor type: AnchorType,
                                  option: AnchorOption) -> LayoutBuilder {
        let anchor = AnchorFactory.build(type,
                                         view: view,
                                         option: option)
        return LayoutBuilder(view, anchors: anchors + [anchor])
    }
}

extension LayoutBuilder: EqualToProtocol {

    public func equalToSuperView() {
        anchors.forEach { anchor in
            anchor.equalToSuperView()
        }
    }

    public func greaterThanOrEqualToSuperView() {
        anchors.forEach { anchor in
            anchor.greaterThanOrEqualToSuperView()
        }
    }

    public func lessThanOrEqualToSuperView() {
        anchors.forEach { anchor in
            anchor.lessThanOrEqualToSuperView()
        }
    }

    public func equalTo(_ anchor: AnchorConvertible) {
        anchors.forEach { a in
            a.equalTo(anchor)
        }
    }

    public func greaterThanOrEqualTo(_ anchor: AnchorConvertible) {
        anchors.forEach { a in
            a.greaterThanOrEqualTo(anchor)
        }
    }

    public func lessThanOrEqualTo(_ anchor: AnchorConvertible) {
        anchors.forEach { a in
            a.lessThanOrEqualTo(anchor)
        }
    }
}
