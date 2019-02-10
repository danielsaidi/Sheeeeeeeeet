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
        case .collections: return CollectionActionSheet(options: options, action: alert)
        case .customView: return CustomActionSheet(options: options, buttonTapAction: alert)
        case .danger: return DestructiveActionSheet(options: options, action: alert)
        case .headerView: return HeaderActionSheet(options: options, action: alert)
        case .links: return LinkActionSheet(options: options, action: alert)
        case .multiSelect: return MultiSelectActionSheet(options: options, preselected: [.fancy, .fast], action: alert)
        case .sections: return SectionActionSheet(options: options, action: alert)
        case .singleSelect: return SingleSelectActionSheet(options: options, preselected: [.fancy, .fast], action: alert)
        case .standard: return StandardActionSheet(options: options, action: alert)
        case .nonDismissable:
            let sheet = StandardActionSheet(options: options, action: alert)
            sheet.presenter.isDismissableWithTapOnBackground = false
            return sheet
        }
    }
}
