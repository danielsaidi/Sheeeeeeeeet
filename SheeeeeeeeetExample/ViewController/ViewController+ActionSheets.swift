//
//  ViewController+ActionSheets.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-02-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This extension is used to provide the main view controller
 with action sheet creation logic.
 
 */

import Sheeeeeeeeet

extension ViewController {
    
    func actionSheet(at indexPath: IndexPath) -> ActionSheet? {
        let options = foodOptions
        switch tableViewOptions[indexPath.row] {
        case .openSheet(.collections): return CollectionActionSheet(options: options, action: alert)
        case .openSheet(.customView): return CustomActionSheet(options: options, buttonTapAction: alert)
        case .openSheet(.danger): return DestructiveActionSheet(options: options, action: alert)
        case .openSheet(.headerView): return HeaderActionSheet(options: options, action: alert)
        case .openSheet(.links): return LinkActionSheet(options: options, action: alert)
        case .openSheet(.multiSelect): return MultiSelectActionSheet(options: options, preselected: [.fancy, .fast], action: alert)
        case .openSheet(.sections): return SectionActionSheet(options: options, action: alert)
        case .openSheet(.singleSelect): return SingleSelectActionSheet(options: options, preselected: [.fancy, .fast], action: alert)
        case .openSheet(.standard): return StandardActionSheet(options: options, action: alert)
        case .openSheet(.nonDismissable):
            let sheet = StandardActionSheet(options: options, action: alert)
            sheet.presenter.isDismissableWithTapOnBackground = false
            return sheet
        }
    }
}
