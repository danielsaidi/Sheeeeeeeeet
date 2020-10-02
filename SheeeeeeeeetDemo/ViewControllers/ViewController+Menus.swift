//
//  ViewController+Menus.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-25.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

extension ViewController {
    
    func menuOption(at indexPath: IndexPath) -> MenuOption {
        menuOptions[indexPath.row]
    }
    
    /**
     Get the food menu at a certain index, if any.
     */
    func foodMenu(at indexPath: IndexPath) -> FoodMenu? {
        switch menuOption(at: indexPath) {
        case .applyAppearance, .separator: return nil
        case .openSheet(.collections): return nil
        case .openSheet(.customView): return CustomMenu(buttonTapAction: alert)
        case .openSheet(.danger): return DestructiveMenu()
        case .openSheet(.headerView): return ItemMenu(food: foodOptions)
        case .openSheet(.links): return LinkMenu(food: foodOptions)
        case .openSheet(.multiLine): return DemoMultilineItemMenu(food: foodOptions)
        case .openSheet(.multiSelect): return MultiSelectMenu(food: foodOptions)
        case .openSheet(.secondaryAction): return SecondaryActionMenu(food: foodOptions)
        case .openSheet(.sections): return SectionMenu(food: foodOptions)
        case .openSheet(.singleSelect): return SingleSelectMenu(food: foodOptions)
        case .openSheet(.standard): return ItemMenu(food: foodOptions)
        case .openSheet(.nonDismissable): return NonDismissableMenu(food: foodOptions)
        case .openSheet(.dismissableOnDidEnterBackground): return BackgroundDismissableMenu(food: foodOptions)
        }
    }
}
