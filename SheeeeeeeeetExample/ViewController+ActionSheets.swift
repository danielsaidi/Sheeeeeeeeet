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
        case .singleSelect: return singleSelectActionSheet(preselected: .fancy)
        case .multiSelect: return multiSelectActionSheet(preselected: [.fancy, .fast])
        case .toggle: return toggleActionSheet(preselected: [.fancy, .fast])
        case .links: return linkActionSheet()
        case .headerView: return headerViewActionSheet()
        case .sections: return sectionActionSheet()
        case .danger: return destructiveActionSheet()
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
    
    
    // MARK: - Functions
    
    func standardActionSheet() -> ActionSheet {
        var items = foodOptions().map { $0.item() }
        items.insert(titleItem, at: 0)
        items.append(cancelButton)
        return ActionSheet(items: items) { (_, item) in
            guard item.value != nil else { return }
            self.alert(item: item)
        }
    }
    
    func singleSelectActionSheet(preselected: FoodOption?) -> ActionSheet {
        var items = foodOptions().map { $0.selectItem(isSelected: $0 == preselected) }
        items.insert(titleItem, at: 0)
        items.append(okButton)
        items.append(cancelButton)
        return ActionSheet(items: items) { (sheet, item) in
            let items = sheet.items.flatMap { $0 as? ActionSheetSelectItem }
            let deselect = items.filter { $0.title != item.title }
            deselect.forEach { $0.isSelected = false }
            guard item.value as? Bool == true else { return }
            self.alert(item: item)
        }
    }
    
    func multiSelectActionSheet(preselected: [FoodOption]) -> ActionSheet {
        var items = foodOptions().map { $0.selectItem(isSelected: preselected.contains($0)) }
        items.insert(titleItem, at: 0)
        items.append(okButton)
        items.append(cancelButton)
        return ActionSheet(items: items) { (sheet, item) in
            guard item.value as? Bool == true else { return }
            let items = sheet.items.flatMap { $0 as? ActionSheetSelectItem }
            let selected = items.filter { $0.isSelected }
            self.alert(items: selected)
        }
    }
    
    func toggleActionSheet(preselected: [FoodOption]) -> ActionSheet {
        var items = foodOptions().map { $0.toggleItem(isToggled: preselected.contains($0)) }
        items.insert(titleItem, at: 0)
        items.append(okButton)
        items.append(cancelButton)
        return ActionSheet(items: items) { (sheet, item) in
            guard item.value as? Bool == true else { return }
            let items = sheet.items.flatMap { $0 as? ActionSheetToggleItem }
            let toggled = items.filter { $0.isToggled }
            self.alert(items: toggled)
        }
    }
    
    func linkActionSheet() -> ActionSheet {
        var items = foodOptions().map { $0.linkItem() }
        let title = titleItem
        title.title = "What do you want to buy?"
        items.insert(titleItem, at: 0)
        items.append(cancelButton)
        return ActionSheet(items: items) { (_, item) in
            guard item.value != nil else { return }
            self.alert(item: item)
        }
    }
    
    func headerViewActionSheet() -> ActionSheet {
        let sheet = standardActionSheet()
        let image = UIImage(named: "title-image")
        sheet.headerView = UIImageView(image: image)
        sheet.headerView?.frame.size.height = 150
        return sheet
    }
    
    func sectionActionSheet() -> ActionSheet {
        let cheapOptions = foodOptions().filter { $0.isCheap }
        let cheapItems = cheapOptions.map { $0.item() }
        let expensiveOptions = foodOptions().filter { !$0.isCheap }
        let expensiveItems = expensiveOptions.map { $0.item() }
        
        var items: [ActionSheetItem] = [titleItem]
        items.append(ActionSheetSectionTitle(title: "Cheap"))
        cheapItems.forEach { items.append($0) }
        items.append(ActionSheetSectionMargin())
        items.append(ActionSheetSectionTitle(title: "Expensive"))
        expensiveItems.forEach { items.append($0) }
        items.append(cancelButton)
        
        return ActionSheet(items: items) { (_, item) in
            guard item.value != nil else { return }
            self.alert(item: item)
        }
    }
    
    func destructiveActionSheet() -> ActionSheet {
        let titleItem = ActionSheetTitle(title: "Remove Payment Options")
        let image = UIImage(named: "ic_credit_card")
        let visaTitle = "Visa **** **** **** 4321"
        let visa = ActionSheetToggleItem(title: visaTitle, isToggled: false, value: "visa", image: image)
        let masterTitle = "MasterCard **** **** **** 9876"
        let master = ActionSheetToggleItem(title: masterTitle, isToggled: false, value: "master", image: image)
        let removeButton = ActionSheetDangerButton(title: "Remove")
        let items = [titleItem, visa, master, cancelButton, removeButton]
        return ActionSheet(items: items) { (sheet, item) in
            guard item.value as? Bool == true else { return }
            let items = sheet.items.flatMap { $0 as? ActionSheetToggleItem }
            let toggled = items.filter { $0.isToggled }
            self.alert(items: toggled)
        }
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
    
    func toggleItem(isToggled: Bool) -> ActionSheetItem {
        return ActionSheetToggleItem(
            title: displayName,
            isToggled: isToggled,
            value: self,
            image: image)
    }
}
