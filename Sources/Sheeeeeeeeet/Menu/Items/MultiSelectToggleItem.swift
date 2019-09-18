//
//  MultiSelectToggleItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 Multi-select toggle items can be used together with a group
 of `MultiSelectItem`s. When it's tapped, it makes all items
 in the same group become selected or deselected.
 
 Since this item must know about the multi-select items that
 are in the same group, in order to propertly refresh itself,
 you must give it an initial `State` when creating it. After
 that, it wll be able to update itself whenever it is tapped.
 */
open class MultiSelectToggleItem: MenuItem {
    
    
    // MARK: - Initialization
    
    public init(title: String, state: State, group: String, selectAllTitle: String, deselectAllTitle: String) {
        self.group = group
        self.state = state
        self.deselectAllTitle = deselectAllTitle
        self.selectAllTitle = selectAllTitle
        super.init(title: title, tapBehavior: .none)
    }
    
    
    // MARK: - State
    
    public enum State {
        case selectAll, deselectAll
    }
    
    
    // MARK: - Properties
    
    public let deselectAllTitle: String
    public let group: String
    public let selectAllTitle: String
    public var state: State
    
    
    // MARK: - ActionSheetItemConvertible
    
    override func toActionSheetItem() -> ActionSheetItem {
        ActionSheetMultiSelectToggleItem(
            title: title,
            state: state,
            group: group,
            selectAllTitle: selectAllTitle,
            deselectAllTitle: deselectAllTitle
        )
    }
}
