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
 A `CustomItem` can be used to wrap any item that implements
 `CustomItemType`. The embedded item can then be used in any
 way you like, given that is works for the use case.
 
 For instance, using custom items in `ActionSheet`s requires
 that the embedded type is an `ActionSheetItemCell`.
 */
open class CustomItem: MenuItem {
    
    public init(
        itemType: CustomItemType.Type,
        itemSetupAction: @escaping ItemAction) {
        self.itemType = itemType
        self.itemSetupAction = itemSetupAction
        super.init(title: "", tapBehavior: .none)
    }
    
    public typealias ItemAction = (CustomItemType) -> Void
    
    public let itemType: CustomItemType.Type
    public let itemSetupAction: ItemAction
    
    override var canBeUsedInAlertController: Bool { false }
    override var canBeUsedInContextMenu: Bool { false }
}

/**
 This protocol must be implemented by any item that is to be
 used together with an `CustomItem`, regardless of what that
 item will later be used for.
 */
public protocol CustomItemType {
    
    static var preferredSize: CGSize { get }
}
