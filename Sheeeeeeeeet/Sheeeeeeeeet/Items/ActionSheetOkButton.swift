//
//  ActionSheetOkButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 OK buttons have no special behavior, but can be used when a
 user should apply action sheet changes by tapping an button.
 
 */

import UIKit

public class ActionSheetOkButton: ActionSheetButton {
    
    
    // MARK: - Initialization
    
    public override init(title: String) {
        super.init(title: title)
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetOkButtonAppearance(copy: appearance.okButton)
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        cell.textLabel?.textAlignment = .center
    }
}
