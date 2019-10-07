//
//  LayoutAnchor.swift
//  Tanjiro-iOS
//
//  Created by jean.vinge on 25/07/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

public protocol EqualToProtocol {
    func equalToSuperView()
    func greaterThanOrEqualToSuperView()
    func lessThanOrEqualToSuperView()
    func equalTo(_ anchor: AnchorConvertable)
    func greaterThanOrEqualTo(_ anchor: AnchorConvertable)
    func lessThanOrEqualTo(_ anchor: AnchorConvertable)
}
