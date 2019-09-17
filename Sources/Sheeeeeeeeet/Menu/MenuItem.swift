//
//  MenuItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This class is a base class for all menu items, like buttons,
 items etc. All items inherit this class, even if they don't
 make use of all its properties.
 
 `tapBehavior` is used to describe what should happen when a
 user taps an item. `.dismiss` means that the menu should be
 dismissed while `.none` means that it shouldn't.
 */
open class MenuItem {
    
    
    // MARK: - Initialization
    
    public init(
        title: String,
        subtitle: String? = nil,
        value: Any? = nil,
        image: UIImage? = nil,
        tapBehavior: TapBehavior = .dismiss) {
        self.title = title
        self.subtitle = subtitle
        self.value = value
        self.image = image
        self.tapBehavior = tapBehavior
    }
    
    
    // MARK: - Types
    
    public enum TapBehavior {
        case dismiss, none
    }
    
    
    // MARK: - Properties
    
    public let image: UIImage?
    public let subtitle: String?
    public let tapBehavior: TapBehavior
    public let title: String
    public let value: Any?
}
