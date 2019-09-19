//
//  SectionMargin.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This item can be used to add margins above or below section
 items. It will be converted to a correct view if applicable
 or ignored if it's not.
 */
open class SectionMargin: SectionItem {
    
    
    // MARK - Initialization
    
    public init() {
        super.init(title: "")
    }

    
    // MARK: - ActionSheetItemConvertible
    
    override func toActionSheetItem() -> ActionSheetItem {
        ActionSheetSectionMargin()
    }
}
