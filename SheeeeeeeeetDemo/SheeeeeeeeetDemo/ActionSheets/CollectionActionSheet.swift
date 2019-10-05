//
//  CollectionActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

/**
 This action sheet takes a `CollectionMenu` and modifies its
 select action to fit the collection view.
 
 The only reason to why the demo has a separate action sheet
 for the collection-based example is that is has a different
 select action signature.
 */
class CollectionActionSheet: ActionSheet {
    
    convenience init(menu: CollectionMenu, action: @escaping ([CollectionMenu.Cell.Item]) -> ()) {
        self.init(menu: menu) { _, item in
            guard item is OkButton else { return }
            action(menu.selectedItems)
        }
    }
}
