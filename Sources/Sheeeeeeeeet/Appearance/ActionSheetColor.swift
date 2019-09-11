//
//  ActionSheetColors.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This enum specifies standard action sheet colors, which are
 just aliases for system colors. Use the `color` property to
 get the resolved `UIColor` representation.
 
 The enum cases are aliases for iOS 13 semantic and adaptive
 colors, but provide fallbacks to older, non-adaptive colors
 on iOS 12 and earlier.
 */
public enum ActionSheetColor: CaseIterable {

    case actionText
    case background
    case danger
    case disabledText
    case discreteText
    case overlay
    case separator
    case text
    case tint
}


// MARK: - Public Extensions

public extension ActionSheetColor {
    
    /**
     Get the UI color representation of the semantic color.
     */
    var color: UIColor {
        if #available(iOS 13.0, *) {
            return adaptiveColor
        } else {
            return legacyColor
        }
    }
}


// MARK: - Private Extensions

private extension ActionSheetColor {
    
    var overlay: UIColor {
        UIColor.black.withAlphaComponent(0.6)
    }
    
    @available(iOS 13.0, *)
    var adaptiveColor: UIColor {
        switch self {
        case .actionText: return .systemBlue
        case .background: return .tertiarySystemBackground
        case .danger: return .systemRed
        case .disabledText: return .secondaryLabel
        case .discreteText: return .secondaryLabel
        case .overlay: return overlay
        case .separator: return .separator
        case .text, .tint: return .label
        }
    }
    
    var legacyColor: UIColor {
        switch self {
        case .actionText: return .blue
        case .background: return .white
        case .danger: return .red
        case .disabledText: return .lightGray
        case .discreteText: return .lightGray
        case .overlay: return overlay
        case .separator: return .lightGray
        case .text, .tint: return .darkText
        }
    }
}
