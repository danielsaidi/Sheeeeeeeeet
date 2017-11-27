//
//  ViewController+Sheets.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet


// MARK: - Action Sheet Extensions

extension ViewController {
    
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
        return ActionSheet(items: items) { (sheet, item) in
            self.alert(item: item)
        }
    }
    
    func singleSelectActionSheet(preselected: FoodOption?) -> ActionSheet {
        var items = foodOptions().map { $0.singleSelectItem(isSelected: $0 == preselected) }
        items.insert(titleItem, at: 0)
        return ActionSheet(items: items) { (sheet, item) in
            self.alert(item: item)
        }
    }
    
    func multiSelectActionSheet(preselected: [FoodOption]) -> ActionSheet {
        var items = foodOptions().map { $0.multiSelectItem(isSelected: preselected.contains($0)) }
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
}


// MARK: - Action Sheet Item Extensions

fileprivate extension FoodOption {
    
    func item() -> ActionSheetItem {
        return ActionSheetItem(
            title: displayName,
            value: self,
            image: image)
    }
    
    func multiSelectItem(isSelected: Bool) -> ActionSheetItem {
        let item = singleSelectItem(isSelected: isSelected)
        item.tapBehavior = .none
        return item
    }
    
    func singleSelectItem(isSelected: Bool) -> ActionSheetItem {
        return ActionSheetSelectItem(
            title: displayName,
            isSelected: isSelected,
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
