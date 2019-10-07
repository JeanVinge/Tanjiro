//
//  LayoutBuilder+UIView.swift
//  Tanjiro
//
//  Created by jean.vinge on 07/10/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public extension UIView {
    func layout() -> LayoutBuilder {
        translatesAutoresizingMaskIntoConstraints = false
        return LayoutBuilder(self)
    }
    func layout(using closure: (LayoutBuilder) -> Void) {
        closure(layout())
    }
}
