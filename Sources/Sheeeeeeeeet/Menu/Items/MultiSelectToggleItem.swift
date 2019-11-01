//
//  MultiSelectToggleItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 A `MultiSelectToggleItem` can be used together with a group
 of `MultiSelectItem` items and will toggle the select state
 of all items in the same group when it's tapped.
 
 Since this item must know about the multi-select items that
 are in the same group, in order to propertly refresh itself,
 you must give it an initial `State` when creating it. After
 that, it's able to update itself whenever it's tapped.
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
    
    override var canBeUsedInAlertController: Bool { false }
    override var canBeUsedInContextMenu: Bool { false }
    
    
    // MARK: - Functions
    
    open override func handleSelection(in menu: Menu) {
        super.handleSelection(in: menu)
        let selectItems = menu.items.compactMap { $0 as? MultiSelectItem }
        let items = selectItems.filter { $0.group == group }
        let shouldSelectAll = items.contains { !$0.isSelected }
        items.forEach { $0.isSelected = shouldSelectAll ? true : false }
        refresh(for: menu)
    }
    
    open func refresh(for menu: Menu) {
        let selectItems = menu.items.compactMap { $0 as? MultiSelectItem }
        let items = selectItems.filter { $0.group == group }
        guard items.count > 0 else { return state = .selectAll }
        state = items.contains { !$0.isSelected } ? .selectAll : .deselectAll
    }
}
