//
//  SectionTitle.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 Section titles can be used to add titles to sections within
 a menu. They have no purpose besides visually indicating if
 items belong together.
 
 To add additional space above a section title, make sure to
 add a `SectionMargin` before the title.
 */
open class SectionTitle: SectionItem {
    
    
    // MARK: - ActionSheetItemConvertible
    
    override func toActionSheetItem() -> ActionSheetItem {
        ActionSheetSectionTitle(title: title, subtitle: subtitle)
    }
}
