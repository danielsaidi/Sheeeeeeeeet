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
        switch menuOption(at: indexPath) {
        case .openSheet(.collections):
            return CollectionActionSheet(action: alert)
        case .openSheet(.customView): return CustomActionSheet(options: foodOptions, buttonTapAction: alert)
        default:
            guard let menu = foodMenu(at: indexPath) else { return nil }
            let headerImage = headerImageName(at: indexPath)
            return FoodActionSheet(menu: menu, headerImageName: headerImage, action: alert)
        }
    }
    
    func headerImageName(at indexPath: IndexPath) -> String? {
        switch menuOption(at: indexPath) {
        case .openSheet(.headerView): return "title-image"
        default: return nil
        }
    }
    
    func foodMenu(at indexPath: IndexPath) -> FoodMenu? {
        switch menuOption(at: indexPath) {
        case .applyAppearance, .separator: return nil
        case .openSheet(.collections): return nil
        case .openSheet(.customView): return nil
        case .openSheet(.danger): return DestructiveMenu()
        case .openSheet(.headerView): return FoodItemMenu(food: foodOptions)
        case .openSheet(.links): return FoodLinkMenu(food: foodOptions)
        case .openSheet(.multiSelect): return FoodMultiSelectMenu(food: foodOptions)
        case .openSheet(.sections): return FoodSectionMenu(food: foodOptions)
        case .openSheet(.singleSelect): return FoodSingleSelectMenu(food: foodOptions)
        case .openSheet(.standard): return FoodItemMenu(food: foodOptions)
        case .openSheet(.nonDismissable): return FoodItemMenu(food: foodOptions, configuration: .nonDismissable)
        }
    }
}
