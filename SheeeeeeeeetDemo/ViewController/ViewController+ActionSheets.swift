//
//  ViewController+ActionSheets.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

extension ViewController {
    
    /**
     Get the action sheet option at a certain index, if any.
     */
    func actionSheet(at indexPath: IndexPath) -> ActionSheet? {
        if let menu = foodMenu(at: indexPath) {
            return FoodActionSheet(menu: menu, action: alert)
        }
        
        switch menuOption(at: indexPath) {
        case .applyAppearance, .separator: return nil
        case .openSheet(.collections): return CollectionActionSheet(options: foodOptions, action: alert)
        case .openSheet(.customView): return CustomActionSheet(options: foodOptions, buttonTapAction: alert)
        case .openSheet(.danger): return nil
        case .openSheet(.headerView): return HeaderActionSheet(options: foodOptions, action: alert)
        case .openSheet(.links): return nil
        case .openSheet(.multiSelect): return nil
        case .openSheet(.sections): return nil
        case .openSheet(.singleSelect): return nil
        case .openSheet(.standard): return nil
        case .openSheet(.nonDismissable):
            let sheet = FoodActionSheet(menu: FoodItemMenu(food: foodOptions), action: alert)
            sheet.presenter.isDismissable = false
            return sheet
        }
    }
    
    func foodMenu(at indexPath: IndexPath) -> FoodMenu? {
        switch menuOption(at: indexPath) {
        case .applyAppearance, .separator: return nil
        case .openSheet(.collections): return nil
        case .openSheet(.customView): return nil
        case .openSheet(.danger): return FoodDestructiveMenu(food: foodOptions)
        case .openSheet(.headerView): return nil
        case .openSheet(.links): return FoodLinkMenu(food: foodOptions)
        case .openSheet(.multiSelect): return FoodMultiSelectMenu(food: foodOptions)
        case .openSheet(.sections): return FoodSectionMenu(food: foodOptions)
        case .openSheet(.singleSelect): return FoodSingleSelectMenu(food: foodOptions)
        case .openSheet(.standard): return FoodItemMenu(food: foodOptions)
        case .openSheet(.nonDismissable): return nil
        }
    }
}
