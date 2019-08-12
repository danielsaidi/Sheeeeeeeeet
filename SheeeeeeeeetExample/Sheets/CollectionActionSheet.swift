//
//  CollectionActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

/*
 
 This example action sheet demonstrates how to create action
 sheets that use the `ActionSheetCollectionItem` item type.
 
 This class calls `setup(items: ...)` after it's initialized,
 since taps in the collection view must reload to the action
 sheet in order to update the selection information.
 
 */

import Sheeeeeeeeet

class CollectionActionSheet: ActionSheet {
    
    init(options: [FoodOption], action: @escaping ([DemoCollectionViewCell.Item]) -> ()) {
        let collectionItems = CollectionActionSheet.collectionItems
        super.init(items: []) { _, item in
            guard item.isOkButton else { return }
            action(collectionItems.filter { $0.isSelected })
        }
        let items = self.items(for: options, collectionItems: collectionItems)
        setup(items: items)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

private extension CollectionActionSheet {
    
    static var collectionItems: [DemoCollectionViewCell.Item] {
        var items: [DemoCollectionViewCell.Item] = []
        for i in 0...20 {
            items.append(DemoCollectionViewCell.Item(title: "\(i)", subtitle: "\(i)"))
        }
        return items
    }
    
    func items(for options: [FoodOption], collectionItems: [DemoCollectionViewCell.Item]) -> [ActionSheetItem] {
        let title = ActionSheetSectionTitle(title: ActionSheet.standardTitle, subtitle: selectionSubtitle(for: collectionItems))
        
        let setupAction = { (cell: DemoCollectionViewCell, index: Int) in
            let item = collectionItems[index]
            cell.configureWith(item: item)
        }
        
        let selectionAction = { [weak self] (cell: DemoCollectionViewCell, index: Int) in
            let item = collectionItems[index]
            item.isSelected = !item.isSelected
            title.subtitle = self?.selectionSubtitle(for: collectionItems)
            cell.configureWith(item: item)
            self?.reloadData()
        }
        
        let collectionItem = ActionSheetCollectionItem(
            itemCellType: DemoCollectionViewCell.self,
            itemCount: collectionItems.count,
            setupAction: setupAction,
            selectionAction: selectionAction
        )
        
        return [
            ActionSheetSectionMargin(),
            title,
            ActionSheetSectionMargin(),
            collectionItem,
            ActionSheet.okButton,
            ActionSheet.cancelButton]
    }
    
    func selectionSubtitle(for collectionItems: [DemoCollectionViewCell.Item]) -> String {
        return "Selected items: \(collectionItems.filter { $0.isSelected }.count)"
    }
}
