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

    init(_ view: UIView) {
        self.view = view
    }

    public func left(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.leading, option: option)
        return self
    }

    public func leading(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.leading, option: option)
        return self
    }

    public func right(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.right, option: option)
        return self
    }

    public func trailing(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.trailing, option: option)
        return self
    }

    public func top(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.top, option: option)
        return self
    }

    public func bottom(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.bottom, option: option)
        return self
    }

    public func centerX(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.centerX, option: option)
        return self
    }

    public func centerY(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.centerY, option: option)
        return self
    }

    public func width(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.width, option: option)
        return self
    }

    public func height(_ option: AnchorOption = .none) -> LayoutBuilder {
        makeContraint(.height, option: option)
        return self
    }

    private func makeContraint(_ type: AnchorType,
                               option: AnchorOption) {
        add(AnchorFactory.build(type, view: view, option: option))
    }

    private func add(_ contraint: EqualToProtocol) {
        anchors.append(contraint)
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

    public func equalTo(_ anchor: AnchorConvertable) {
        anchors.forEach { a in
            a.equalTo(anchor)
        }
    }

    public func greaterThanOrEqualTo(_ anchor: AnchorConvertable) {
        anchors.forEach { a in
            a.greaterThanOrEqualTo(anchor)
        }
    }

    public func lessThanOrEqualTo(_ anchor: AnchorConvertable) {
        anchors.forEach { a in
            a.lessThanOrEqualTo(anchor)
        }
    }
}
