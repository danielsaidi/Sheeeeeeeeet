//
//  ViewController+Sheets.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet


// MARK: - Public Extensions

extension ViewController {
    
    func actionSheet(at indexPath: IndexPath) -> ActionSheet? {
        switch tableViewOptions[indexPath.row] {
        case .standard: return standardActionSheet()
        case .select: return multiSelectActionSheet(preselected: [.fancy, .fast])
        case .singleSelect: return singleSelectActionSheet()
        case .toggle: return toggleActionSheet(preselected: [.fancy, .fast])
        case .links: return linkActionSheet()
        case .headerView: return headerViewActionSheet()
        case .sections: return sectionActionSheet()
        case .danger: return destructiveActionSheet()
        case .collections: return collectionActionSheet()
        default: return nil
        }
    }
}


// MARK: - Action Sheet Extensions

fileprivate extension ViewController {
    
    
    // MARK: - Helper properties
    
    fileprivate var cancel: String { return "Cancel" }
    fileprivate var cancelButton: ActionSheetCancelButton { return ActionSheetCancelButton(title: cancel) }
    fileprivate var ok: String { return "OK" }
    fileprivate var okButton: ActionSheetOkButton { return ActionSheetOkButton(title: ok) }
    fileprivate var titleItem: ActionSheetTitle { return ActionSheetTitle(title: titleString) }
    fileprivate var titleString: String { return "What do you want to eat?" }


    // MARK: - Dependency properties

    static weak var currentSheet: ActionSheet?


    // MARK: - Helper functions

    fileprivate func subtitle(for collectionItems: [MyCollectionViewCell.Item]) -> String {
        return "Selected items \(collectionItems.filter { $0.isSelected }.count)"
    }

    
    // MARK: - Functions
    
    func standardActionSheet() -> ActionSheet {
        var items = foodOptions().map { $0.item() }
        items.insert(titleItem, at: 0)
        items.append(cancelButton)
        return ActionSheet(items: items) { (_, item) in
            if item.value == nil { return }
            self.alert(item: item)
        }
    }
    
    func singleSelectActionSheet() -> ActionSheet {
        let items = singleSelectActionSheetItems()
        return ActionSheet(items: items) { (sheet, item) in
            guard item is ActionSheetOkButton else { return }
            let selectItems = sheet.items.flatMap { $0 as? ActionSheetSingleSelectItem }
            let selectedItems = selectItems.filter { $0.isSelected }
            self.alert(items: selectedItems)
        }
    }
    
    func singleSelectActionSheetItems() -> [ActionSheetItem] {
        var items = [ActionSheetItem]()
        items.append(titleItem)
        items.append(contentsOf: singleSelectActionSheetItemsGroup(.fast, group: "Appetizer"))
        items.append(ActionSheetSectionMargin())
        items.append(contentsOf: singleSelectActionSheetItemsGroup(.homeMade, group: "Main Dish"))
        items.append(okButton)
        items.append(cancelButton)
        return items
    }
    
    func singleSelectActionSheetItemsGroup(_ preselected: FoodOption?, group: String) -> [ActionSheetItem] {
        var items = [ActionSheetItem]()
        let options = foodOptions().filter { $0 != .none && $0 != .fancy }
        let foodItems = options.map { $0.singleSelectItem(isSelected: $0 == preselected, group: group) }
        items.append(ActionSheetSectionTitle(title: group))
        items.append(contentsOf: foodItems)
        return items
    }
    
    func multiSelectActionSheet(preselected: [FoodOption]) -> ActionSheet {
        let items = multiSelectActionSheetItems(preselected)
        return ActionSheet(items: items) { (sheet, item) in
            guard item is ActionSheetOkButton else { return }
            let selectItems = sheet.items.flatMap { $0 as? ActionSheetSelectItem }
            let selectedItems = selectItems.filter { $0.isSelected }
            self.alert(items: selectedItems)
        }
    }
    
    func multiSelectActionSheetItems(_ preselected: [FoodOption]) -> [ActionSheetItem] {
        var items = foodOptions().map { $0.selectItem(isSelected: preselected.contains($0)) }
        items.insert(titleItem, at: 0)
        items.append(okButton)
        items.append(cancelButton)
        return items
    }
    
    func toggleActionSheet(preselected: [FoodOption]) -> ActionSheet {
        let items = toggleActionSheetItems(preselected)
        return ActionSheet(items: items) { (sheet, item) in
            guard item is ActionSheetOkButton else { return }
            let toggleItems = sheet.items.flatMap { $0 as? ActionSheetToggleItem }
            let toggledItems = toggleItems.filter { $0.isToggled }
            self.alert(items: toggledItems)
        }
    }
    
    func toggleActionSheetItems(_ preselected: [FoodOption]) -> [ActionSheetItem] {
        var items = foodOptions().map { $0.toggleItem(isToggled: preselected.contains($0)) }
        items.insert(titleItem, at: 0)
        items.append(okButton)
        items.append(cancelButton)
        return items
    }

    func linkActionSheet() -> ActionSheet {
        let items = linkActionSheetItems()
        return ActionSheet(items: items) { (_, item) in
            guard item.value != nil else { return }
            self.alert(item: item)
        }
    }
    
    func linkActionSheetItems() -> [ActionSheetItem] {
        var items = foodOptions().map { $0.linkItem() }
        items.insert(titleItem, at: 0)
        items.append(cancelButton)
        return items
    }
    
    func headerViewActionSheet() -> ActionSheet {
        let sheet = standardActionSheet()
        let image = UIImage(named: "title-image")
        sheet.headerView = UIImageView(image: image)
        sheet.headerView?.frame.size.height = 150
        return sheet
    }
    
    func sectionActionSheet() -> ActionSheet {
        let items = sectionActionSheetItems()
        return ActionSheet(items: items) { (_, item) in
            guard item.value != nil else { return }
            self.alert(item: item)
        }
    }
    
    func sectionActionSheetItems() -> [ActionSheetItem] {
        var items: [ActionSheetItem] = [titleItem]
        items.append(ActionSheetSectionTitle(title: "Cheap"))
        let cheap = foodOptions().filter { $0.isCheap }.map { $0.item() }
        cheap.forEach { items.append($0) }
        items.append(ActionSheetSectionMargin())
        items.append(ActionSheetSectionTitle(title: "Expensive"))
        let expensive = foodOptions().filter { !$0.isCheap }.map { $0.item() }
        expensive.forEach { items.append($0) }
        items.append(cancelButton)
        return items
    }
    
    func collectionActionSheet() -> ActionSheet {
        let collectionItems = collectionActionSheetCollectionItems()
        let items = collectionActionSheetItems(with: collectionItems)
        let sheet = ActionSheet(items: items) { (_, item) in
            if item is ActionSheetOkButton {
                let selectedItems = collectionItems.filter { $0.isSelected }
                self.alert(items: selectedItems)
            } else {
                self.alert(item: item)
            }
        }
        ViewController.currentSheet = sheet
        return sheet
    }
    
    func collectionActionSheetCollectionItems() -> [MyCollectionViewCell.Item] {
        var items: [MyCollectionViewCell.Item] = []
        for i in 0...20 {
            let item = MyCollectionViewCell.Item(title: "\(i)", subtitle: "\(i)")
            items.append(item)
        }
        return items
    }

    func collectionActionSheetItems(with collectionItems: [MyCollectionViewCell.Item]) -> [ActionSheetItem] {
        let foodItems = foodOptions().map { $0.item() }

        let titleItemCustom = ActionSheetItem(title: titleString, subtitle: subtitle(for: collectionItems))

        let setupAction = { (cell: MyCollectionViewCell, index: Int) in
            let item = collectionItems[index]
            cell.configureWith(item: item)
        }
        
        let selectionAction = {[ weak self] (cell: MyCollectionViewCell, index: Int) in
            let item = collectionItems[index]
            item.isSelected = !item.isSelected
            titleItemCustom.subtitle = self?.subtitle(for: collectionItems)
            cell.configureWith(item: item)

            ViewController.currentSheet?.reloadData()
        }

        let collectionItem = ActionSheetCollectionItem(
            cellType: MyCollectionViewCell.self,
            itemCount: collectionItems.count,
            setupAction: setupAction,
            selectionAction: selectionAction
        )

        return [titleItemCustom, foodItems.first!, collectionItem, foodItems.last!, okButton, cancelButton]
    }
    
    func destructiveActionSheet() -> ActionSheet {
        let items = destructiveActionSheetItems()
        return ActionSheet(items: items) { (sheet, item) in
            guard item is ActionSheetOkButton else { return }
            let items = sheet.items.flatMap { $0 as? ActionSheetToggleItem }
            let toggled = items.filter { $0.isToggled }
            self.alert(items: toggled)
        }
    }
    
    func destructiveActionSheetItems() -> [ActionSheetItem] {
        let titleItem = ActionSheetTitle(title: "Remove Payment Options")
        let image = UIImage(named: "ic_credit_card")
        let visaTitle = "Visa **** **** **** 4321"
        let visa = ActionSheetToggleItem(title: visaTitle, isToggled: false, value: "visa", image: image)
        let masterTitle = "MasterCard **** **** **** 9876"
        let master = ActionSheetToggleItem(title: masterTitle, isToggled: false, value: "master", image: image)
        let removeButton = ActionSheetDangerButton(title: "Remove")
        return [titleItem, visa, master, cancelButton, removeButton]
    }
}


// MARK: - Action Sheet Item Extensions

fileprivate extension FoodOption {
    
    func item() -> ActionSheetItem {
        return ActionSheetItem(
            title: displayName,
            value: self,
            image: image)
    }
    
    func linkItem() -> ActionSheetItem {
        return ActionSheetLinkItem(
            title: displayName,
            value: self,
            image: image)
    }
    
    func selectItem(isSelected: Bool) -> ActionSheetItem {
        let item = ActionSheetSelectItem(
            title: displayName,
            isSelected: isSelected,
            value: self,
            image: image)
        item.tapBehavior = .none
        return item
    }
    
    func singleSelectItem(isSelected: Bool, group: String) -> ActionSheetItem {
        return ActionSheetSingleSelectItem(
            title: displayName,
            isSelected: isSelected,
            group: group,
            value: self,
            image: image)
    }
    
    func toggleItem(isToggled: Bool) -> ActionSheetItem {
        return ActionSheetToggleItem(
            title: displayName,
            isToggled: isToggled,
            value: self,
            image: image)
    }
}
