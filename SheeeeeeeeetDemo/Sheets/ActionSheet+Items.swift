//
//  ActionSheet+Items.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

/*
 
 This extension provides functionality that can be shared by
 all action sheets in the example app.
 
 */

import Sheeeeeeeeet

extension ActionSheet {
    
    // TODO: Remove
    static var cancelButton: ActionSheetCancelButton {
        return ActionSheetCancelButton(title: "Cancel")
    }
    
    // TODO: Remove
    static var okButton: ActionSheetOkButton {
        return ActionSheetOkButton(title: "OK")
    }
    
    // TODO: Remove
    static var standardTitle: String {
        return "What do you want to eat?"
    }
}
