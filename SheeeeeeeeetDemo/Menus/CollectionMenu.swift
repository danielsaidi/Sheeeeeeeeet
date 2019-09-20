//
//  CollectionMenu.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-20.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This menu contains a collection item, which in this demo is
 rendered as a collection view with selectable views.
 
 `IMPORTANT` Action sheets with `ActionSheetCollectionItem`s
 that are mapped from `CollectionItem`s must adjust the item
 select action, if it wants to be able to listen for taps in
 the collection view. Have a look at `CollectionActionSheet`
 for an easy way to do this.
*/
class CollectionMenu: FoodMenu {

    init() {
        collectionItems = (0...20).map { Cell.Item(title: "\($0)") }
        let items = CollectionMenu.menuItems(for: collectionItems)
        super.init(title: "Collection Menu", items: items)
    }
    
    typealias Cell = DemoCollectionViewCell
    
    let collectionItems: [Cell.Item]
    
    var selectedItems: [CollectionMenu.Cell.Item] {
        collectionItems.filter { $0.isSelected }
    }
}

private extension CollectionMenu {
    
    static func menuItems(for collectionItems: [Cell.Item]) -> [MenuItem] {
        let title = SectionTitle(title: "Select items", subtitle: "")
        
        let setupAction = { (cell: Cell, index: Int) in
            let item = collectionItems[index]
            cell.configureWith(item: item)
        }
        
        let selectionAction = { (cell: Cell, index: Int) in
            let item = collectionItems[index]
            item.isSelected = !item.isSelected
            cell.configureWith(item: item)
        }
        
        let collectionItem = CollectionItem(
            itemType: DemoCollectionViewCell.self,
            itemCount: collectionItems.count,
            itemSetupAction: setupAction,
            itemSelectionAction: selectionAction
        )
        
        return [
            SectionMargin(),
            title,
            SectionMargin(),
            collectionItem,
            OkButton(title: "OK"),
            CancelButton(title: "Cancel")]
    }
}
