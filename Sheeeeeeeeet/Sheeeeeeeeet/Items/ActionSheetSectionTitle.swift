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
 
 */

import UIKit

public class ActionSheetSectionTitle: ActionSheetItem {
    
    
    // MARK: - Initialization
    
    public init(title: String) {
        super.init(title: title)
    }
    
    
    // MARK: - Functions
    
    open override func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetSectionTitleAppearance(copy: appearance.sectionTitle)
    }
}
