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
 
 `NOTE` that this menu updates a section title every time an
 item is selected, applying a subtitle that shows the number
 of selected items. When the collection item in this menu is
 later converted to an `ActionSheetCollectionItem`, the item
 modifies `selectionAction` to also reload the table view.
*/
class CollectionMenu: FoodMenu {

    init() {
        let numbers = (0...20)
        collectionItems = numbers.map { Cell.Item(title: "\($0)") }
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
        
        let setupAction = { (cell: CollectionItemType, index: Int) in
            guard let cell = cell as? Cell else { return }
            let item = collectionItems[index]
            cell.configureWith(item: item)
        }
        
        let selectionAction = { (cell: CollectionItemType, index: Int) in
            guard let cell = cell as? Cell else { return }
            let item = collectionItems[index]
            item.isSelected = !item.isSelected
            cell.configureWith(item: item)
            
            let selectedCount = collectionItems.filter { $0.isSelected }.count
            title.subtitle = "Selected items: \(selectedCount)"
        }
        
        let collectionItem = CollectionItem(
            itemType: DemoCollectionViewCell.self,
            itemCount: collectionItems.count,
            itemSetupAction: setupAction,
            itemSelectionAction: selectionAction
        )
        
        return [
            title,
            collectionItem,
            FoodMenu.okButton,
            FoodMenu.cancelButton
        ]
    }
}
