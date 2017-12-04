//
//  ActionSheetSectionTitle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Section title items can be used to split action sheets into
 separate sections. They are not selectable, but will send a
 tap event to the action sheet in which they are used.
 
 To add additional space above a section title, make sure to
 add a `ActionSheetSectionMargin` before the section title.
 
 */

import UIKit

open class ActionSheetSectionTitle: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(title: String) {
        super.init(title: title)
        tapBehavior = .none
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetSectionTitleAppearance(copy: appearance.sectionTitle)
    }
    
    open override func applyAppearance(to cell: UITableViewCell) {
        super.applyAppearance(to: cell)
        cell.selectionStyle = .none
    }
}
