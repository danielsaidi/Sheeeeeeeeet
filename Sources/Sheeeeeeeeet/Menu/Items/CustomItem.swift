//
//  CustomItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

/**
 A custom item can be used to embed any item that implements
 `CustomItemType`. The embedded item can then be used in any
 way you like, given that is works for the use case.
 
 For instance, using custom items in `ActionSheet`s requires
 that the embedded type is an `ActionSheetItemCell`.
 */
open class CustomItem: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(
        itemType: CustomItemType.Type,
        itemSetupAction: @escaping ItemAction) {
        self.itemType = itemType
        self.itemSetupAction = itemSetupAction
        super.init(title: "", tapBehavior: .none)
    }
    
    
    // MARK: - Typealiases
    
    public typealias ItemAction = (CustomItemType) -> Void
    
    
    // MARK: - Properties
    
    public let itemType: CustomItemType.Type
    public let itemSetupAction: ItemAction
}

/**
 This protocol must be implemented by any item that is to be
 used together with an `CustomItem`, regardless of what that
 item will later be used for.
 */
public protocol CustomItemType {
    
    static var preferredSize: CGSize { get }
}
