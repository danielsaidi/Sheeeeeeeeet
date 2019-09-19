//
//  ViewController+Options.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-02-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

extension ViewController {
    
    /**
     Get the action sheet option at a certain index, if any.
     */
    func actionSheet(at indexPath: IndexPath) -> ActionSheet? {
        switch menuOption(at: indexPath) {
        case .applyAppearance, .separator: return nil
        case .openSheet(.collections): return CollectionActionSheet(options: foodOptions, action: alert)
        case .openSheet(.customView): return CustomActionSheet(options: foodOptions, buttonTapAction: alert)
        case .openSheet(.danger): return DestructiveActionSheet(options: foodOptions, action: alert)
        case .openSheet(.headerView): return HeaderActionSheet(options: foodOptions, action: alert)
        case .openSheet(.links): return LinkActionSheet(options: foodOptions, action: alert)
        case .openSheet(.multiSelect): return MultiSelectActionSheet(options: foodOptions, preselected: [.fancy, .fast], action: alert)
        case .openSheet(.sections): return SectionActionSheet(options: foodOptions, action: alert)
        case .openSheet(.singleSelect): return SingleSelectActionSheet(options: foodOptions, preselected: [.fancy, .fast], action: alert)
        case .openSheet(.standard): return StandardActionSheet(options: foodOptions, action: alert)
        case .openSheet(.nonDismissable):
            let sheet = StandardActionSheet(options: foodOptions, action: alert)
            sheet.presenter.isDismissable = false
            return sheet
        }
    }
    
    /**
     Get the appearance option at a certain index, if any.
     */
    func appearance(at indexPath: IndexPath) -> ActionSheetAppearance? {
        switch menuOption(at: indexPath) {
        case .openSheet, .separator: return nil
        case .applyAppearance(.demo): return DemoAppearance()
        case .applyAppearance(.demoColorful): return DemoColorfulAppearance()
        }
    }
}
