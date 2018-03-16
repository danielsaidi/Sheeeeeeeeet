//
//  CollectionActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

/*
 
 This action sheet calls `setupItemsAndButtons` after it has
 been initialized, since taps in the collection view have to
 reload the action sheet to update selection display.
 
 */

import Sheeeeeeeeet

class CollectionActionSheet: ActionSheet {
    
    init(options: [FoodOption], action: @escaping ([MyCollectionViewCell.Item]) -> ()) {
        let collectionItems = CollectionActionSheet.collectionItems()
        super.init(items: []) { _, item in
            guard item is ActionSheetOkButton else { return }
            action(collectionItems.filter { $0.isSelected })
        }
        let items = self.items(for: options, collectionItems: collectionItems)
        setupItemsAndButtons(with: items)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

fileprivate extension CollectionActionSheet {
    
    func selectionSubtitle(for collectionItems: [MyCollectionViewCell.Item]) -> String {
        return "Selected items: \(collectionItems.filter { $0.isSelected }.count)"
    }
    
    func items(for options: [FoodOption], collectionItems: [MyCollectionViewCell.Item]) -> [ActionSheetItem] {
        let title = ActionSheetSectionTitle(title: ActionSheet.standardTitle, subtitle: selectionSubtitle(for: collectionItems))
        
        let setupAction = { (cell: MyCollectionViewCell, index: Int) in
            let item = collectionItems[index]
            cell.configureWith(item: item)
        }
        
        let selectionAction = { [weak self] (cell: MyCollectionViewCell, index: Int) in
            let item = collectionItems[index]
            item.isSelected = !item.isSelected
            title.subtitle = self?.selectionSubtitle(for: collectionItems)
            cell.configureWith(item: item)
            self?.reloadData()
        }
        
        let collectionItem = ActionSheetCollectionItem(
            cellType: MyCollectionViewCell.self,
            itemCount: collectionItems.count,
            setupAction: setupAction,
            selectionAction: selectionAction
        )
        
        return [
            ActionSheetSectionMargin(),
            title,
            ActionSheetSectionMargin(),
            collectionItem,
            ActionSheet.createOkButton(),
            ActionSheet.createCancelButton()]
    }
    
    static func collectionItems() -> [MyCollectionViewCell.Item] {
        var items: [MyCollectionViewCell.Item] = []
        for i in 0...20 {
            items.append(MyCollectionViewCell.Item(title: "\(i)", subtitle: "\(i)"))
        }
        return items
    }
}
