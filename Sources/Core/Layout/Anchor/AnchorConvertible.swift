
//
//  AnchorConvertible.swift
//  Tanjiro
//
//  Created by jean.vinge on 07/10/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public protocol AnchorConvertible {
    func toAnchorX() throws -> AnchorX.AnchorLayout
    func toAnchorY() throws -> AnchorY.AnchorLayout
    func toAnchorDimension() throws -> AnchorDimension.AnchorLayout
}

extension AnchorConvertible {
    public func toAnchorX() throws -> AnchorX.AnchorLayout { throw TanjiroError.anchorXError }
    public func toAnchorY() throws -> AnchorY.AnchorLayout { throw TanjiroError.anchorYError }
    public func toAnchorDimension() throws -> AnchorDimension.AnchorLayout { throw TanjiroError.anchorDimensionError }
}

extension NSLayoutYAxisAnchor: AnchorConvertible {
    public func toAnchorY() throws -> AnchorY.AnchorLayout {
        return self
    }
}
extension NSLayoutXAxisAnchor: AnchorConvertible {
    public func toAnchorX() throws -> AnchorX.AnchorLayout {
        return self
    }
}
extension NSLayoutDimension: AnchorConvertible {
    public func toAnchorDimension() throws -> AnchorDimension.AnchorLayout {
        return self
    }
}
