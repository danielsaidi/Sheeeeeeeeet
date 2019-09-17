//
//  ActionSheetMargin.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-02-22.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This enum represents the edge margins of an action sheet.
 */
public enum ActionSheetMargin {
    
    case top, left, right, bottom
    
    func value(in view: UIView) -> CGFloat {
        guard #available(iOS 11.0, *) else { return 0 }
        let insets = view.safeAreaInsets
        switch self {
        case .top: return insets.top
        case .left: return insets.left
        case .right: return insets.right
        case .bottom: return insets.bottom
        }
    }
    
    func value(in view: UIView, minimum: CGFloat) -> CGFloat {
        max(value(in: view), minimum)
    }
}
