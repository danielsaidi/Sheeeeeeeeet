//
//  SelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 Select items can be used to let users select one or several
 items in a menu. It extends `MenuItem` with an `isSelected`
 state and a selected icon.
 
 This item type is not meant to be used directly. You should
 instead use the single- and multi-select subclasses.
 */
open class SelectItem: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(
        title: String,
        subtitle: String? = nil,
        isSelected: Bool,
        group: String = "",
        value: Any? = nil,
        image: UIImage? = nil,
        tapBehavior: TapBehavior = .dismiss) {
        self.isSelected = isSelected
        self.group = group
        super.init(
            title: title,
            subtitle: subtitle,
            value: value,
            image: image,
            tapBehavior: tapBehavior
        )
    }
    
    
    // MARK: - Properties
    
    public let group: String
    public let isSelected: Bool
}
