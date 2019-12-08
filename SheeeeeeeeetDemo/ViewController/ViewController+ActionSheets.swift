//
//  ViewController+ActionSheets.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import Sheeeeeeeeet

extension ViewController {
    
    /**
     Get the action sheet option at a certain index, if any.
     */
    func actionSheet(at indexPath: IndexPath) -> ActionSheet? {
        switch menuOption(at: indexPath) {
        case .openSheet(.collections):
            let menu = CollectionMenu()
            return CollectionActionSheet(menu: menu, action: alert)
        default:
            guard let menu = foodMenu(at: indexPath) else { return nil }
            return FoodActionSheet(
                menu: menu,
                configuration: self.configuration(for: menu),
                headerImageName: headerImageName(at: indexPath),
                action: alert
            )
        }
    }
    
    func headerImageName(at indexPath: IndexPath) -> String? {
        switch menuOption(at: indexPath) {
        case .openSheet(.headerView): return "title-image"
        default: return nil
        }
    }
}

private extension ViewController {
    
    func configuration(for menu: Menu) -> ActionSheet.Configuration {
        if menu is BackgroundDismissableMenu { return .backgroundDismissable }
        if menu is NonDismissableMenu { return .nonDismissable }
        return .standard
    }
}
