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
    
    
    @available(*, deprecated, message: "backgroundColor will be removed in 1.4.0. Use appearance().backgroundColor and backgroundColor instead.")
    public var backgroundColor: UIColor?
    
    @available(*, deprecated, message: "font will be removed in 1.4.0. Use appearance().titleFont and titleFont instead.")
    public var font: UIFont?
    
    @available(*, deprecated, message: "subtitleFont will be removed in 1.4.0. Use appearance().subtitleFont and subtitleFont instead.")
    public var subtitleFont: UIFont?
   
    @available(*, deprecated, message: "subtitleTextColor will be removed in 1.4.0. Use appearance().subtitleColor and subtitleColor instead.")
    public var subtitleTextColor: UIColor?
    
    @available(*, deprecated, message: "textColor will be removed in 1.4.0. Use appearance().titleColor and titleColor instead.")
    public var textColor: UIColor?
    
    @available(*, deprecated, message: "tintColor will be removed in 1.4.0. Use appearance().tintColor and tintColor instead.")
    public var tintColor: UIColor?
    
    @available(*, deprecated, message: "separatorInsets will be removed in 1.4.0. Use appearance().separatorInset and separatorInset instead.")
    public var separatorInsets: UIEdgeInsets?
    
    
    @available(*, deprecated, message: "noSeparator will be removed in 1.4.0. Use UIEdgeInsets.hiddenSeparator instead.")
    public static var noSeparator: UIEdgeInsets {
        return UIEdgeInsets.hiddenSeparator
    }
    
    
    @available(*, deprecated, message: "hideSeparator will be removed in 1.4.0. Use appearance().separatorInset and separatorInset instead.")
    public func hideSeparator() {
        separatorInsets = ActionSheetItemAppearance.noSeparator
    }
    
    
    // TODO
    public var height: CGFloat = 50
}
