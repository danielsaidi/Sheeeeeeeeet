//
//  ActionSheetCancelButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetCancelButton: ActionSheetButton {
    
    
    // MARK: - Initialization
    
    public override init(title: String) {
        super.init(title: title)
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetCancelButtonAppearance(copy: appearance.cancelButton)
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        cell.textLabel?.textAlignment = .center
    }
}
