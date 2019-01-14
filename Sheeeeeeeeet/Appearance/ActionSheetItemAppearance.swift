//
//  ActionSheetItemAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

@available(*, deprecated, message: "ActionSheetItemAppearance will be removed in 1.4.0. Use the new appearance model instead.")
open class ActionSheetItemAppearance {
    
    
    public init() {}
    
    public init(copy: ActionSheetItemAppearance) {
        backgroundColor = copy.backgroundColor
        font = copy.font
        height = copy.height
        separatorInsets = copy.separatorInsets
        textColor = copy.textColor
        tintColor = copy.tintColor
        subtitleFont = copy.subtitleFont
        subtitleTextColor = copy.subtitleTextColor
    }
    
    
    public var backgroundColor: UIColor?
    public var font: UIFont?
    public var subtitleFont: UIFont?
    public var subtitleTextColor: UIColor?
    public var textColor: UIColor?
    public var tintColor: UIColor?
    public var separatorInsets: UIEdgeInsets?
    
    public static var noSeparator: UIEdgeInsets {
        return UIEdgeInsets.hiddenSeparator
    }
    
    public func hideSeparator() {
        separatorInsets = ActionSheetItemAppearance.noSeparator
    }
    
    
    // TODO
    public var height: CGFloat = 50
}
