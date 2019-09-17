//
//  CollectionItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 Collection items can be used to present item collections of
 a certain item type, e.g. in a collection view.
 */
open class CollectionItem<T>: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(
        itemType: T.Type,
        itemCount: Int,
        itemSetupAction: @escaping ItemAction,
        itemSelectionAction: @escaping ItemAction) {
        self.itemType = itemType
        self.itemCount = itemCount
        self.itemSetupAction = itemSetupAction
        self.itemSelectionAction = itemSelectionAction
        super.init(title: "", tapBehavior: .none)
    }
    
    
    // MARK: - Typealiases
    
    public typealias ItemAction = (_ cell: T, _ index: Int) -> Void
    
    
    // MARK: - Properties
    
    public let itemType: T.Type
    public let itemCount: Int
    public let itemSelectionAction: ItemAction
    public let itemSetupAction: ItemAction
}
