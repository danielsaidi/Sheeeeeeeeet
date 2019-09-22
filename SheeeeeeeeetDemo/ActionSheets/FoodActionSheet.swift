//
//  StandardActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

/**
 This action sheet lists food options, and either alerts all
 selected items if an OK button is tapped, or a menu item if
 one is tapped.
 */
class FoodActionSheet: ActionSheet {
    
    convenience init(menu: FoodMenu, headerImageName: String? = nil, action: @escaping ([MenuItem]) -> ()) {
        self.init(menu: menu) { sheet, item in
            if item is CancelButton { return }
            if sheet.shouldAlert(item) { return action([item]) }
            guard item is OkButton else { return }
            let selected = sheet.getSelectedItems()
            guard selected.count > 0 else { return }
            action(selected)
        }
        applyHeader(withImage: headerImageName)
    }
}

private extension ActionSheet {
    
    func applyHeader(withImage imageName: String?) {
        guard let imageName = imageName else { return }
        let image = UIImage(named: imageName)
        headerView = UIImageView(image: image)
        headerView?.frame.size.height = 150
    }
    
    func getSelectedItems() -> [MenuItem] {
        let items = self.items.compactMap { $0 as? SelectItem }
        let selectedItems = items.filter { $0.isSelected }
        return selectedItems
    }
    
    func shouldAlert(_ item: MenuItem) -> Bool {
        item.tapBehavior == .dismiss && !(item is OkButton)
    }
}
