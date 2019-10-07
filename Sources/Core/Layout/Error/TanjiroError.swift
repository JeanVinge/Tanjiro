//
//  TanjiroError.swift
//  Tanjiro
//
//  Created by jean.vinge on 07/10/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import UIKit

enum TanjiroError: Error {
    case anchorXError
    case anchorYError
    case anchorDimensionError
}

extension TanjiroError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .anchorXError:
            return "Anchor point does'nt conform to AnchorX"
        case .anchorYError:
            return "Anchor point does'nt conform to AnchorY"
        case .anchorDimensionError:
            return "Anchor point does'nt conform to AnchorDimension"
        }
    }
}
