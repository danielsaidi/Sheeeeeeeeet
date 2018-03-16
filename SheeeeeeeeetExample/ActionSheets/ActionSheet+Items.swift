//
//  ActionSheet+Items.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

/*
 
 These extensions provides action sheets with functions that
 are shared by all example action sheets.
 
 */

import Sheeeeeeeeet

extension ActionSheet {
    
    static var standardTitle: String { return "What do you want to eat?" }

    
    static func createCancelButton() -> ActionSheetCancelButton {
        return ActionSheetCancelButton(title: "Cancel")
    }
    
    static func createOkButton() -> ActionSheetOkButton {
        return ActionSheetOkButton(title: "OK")
    }
    
    static func createTitleItem(title: String) -> ActionSheetTitle {
        return ActionSheetTitle(title: title)
    }
}
