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
}
