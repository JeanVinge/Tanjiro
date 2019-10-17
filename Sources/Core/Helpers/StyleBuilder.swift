//
//  StyleBuilder.swift
//  Tanjiro-iOS
//
//  Created by jean.vinge on 25/07/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//
// Disclaimer i imported a code from DuctTape repository so part of this code is based on his work
//
// https://github.com/marty-suzuki/DuctTape

import UIKit

@dynamicMemberLookup
public struct Builder<Base: AnyObject> {

    private let _build: () -> Base

    public init(_ build: @escaping () -> Base) {
        self._build = build
    }

    public init(_ base: Base) {
        self._build = { base }
    }

    public subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<Base, Value>) -> (Value) -> Builder<Base> {
        { [build = _build] value in
            Builder {
                let object = build()
                object[keyPath: keyPath] = value
                return object
            }
        }
    }

    public func build() -> Base {
        _build()
    }
}

public protocol LayoutCompatible {
    associatedtype LayoutBase: AnyObject
    var with: Builder<LayoutBase> { get set }
}

extension LayoutCompatible where Self: AnyObject {
    public var with: Builder<Self> {
        get { Builder(self) }
        set {}
    }

    public func with(configure: (inout Self) -> Void) -> Self {
        var this = self
        configure(&this)
        return this
    }
}

#if canImport(Foundation)
import Foundation

extension NSObject: LayoutCompatible {}
#endif
