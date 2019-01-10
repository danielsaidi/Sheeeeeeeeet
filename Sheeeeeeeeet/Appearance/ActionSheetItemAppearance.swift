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
    
    
    // MARK: - Initialization
    
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
    
    
    // MARK: - Properties
    
    @available(*, deprecated, message: "backgroundColor will be removed in 1.4.0. Use the cells' appearance().backgroundColor instead.")
    public var backgroundColor: UIColor?
    
    @available(*, deprecated, message: "font will be removed in 1.4.0. Use the cells' appearance().titleFont instead.")
    public var font: UIFont?
    
    @available(*, deprecated, message: "subtitleFont will be removed in 1.4.0. Use the cells' appearance().subtitleFont instead.")
    public var subtitleFont: UIFont?
   
    @available(*, deprecated, message: "subtitleTextColor will be removed in 1.4.0. Use the cells' appearance().subtitleColor instead.")
    public var subtitleTextColor: UIColor?
    
    @available(*, deprecated, message: "textColor will be removed in 1.4.0. Use the cells' appearance().titleColor instead.")
    public var textColor: UIColor?
    
    
    // TODO
    public var height: CGFloat = 50
    public var separatorInsets: UIEdgeInsets = .zero
    public var tintColor: UIColor?
}


// MARK: - Public Extensions

public extension ActionSheetItemAppearance {
    
    public static var noSeparator: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100_000)
    }
    
    public func hideSeparator() {
        separatorInsets = ActionSheetItemAppearance.noSeparator
    }
}
