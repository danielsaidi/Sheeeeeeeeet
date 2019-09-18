//
//  SectionTitleMargin.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

open class SectionTitleMargin: MenuTitle {
    
    
    // MARK - Initialization
    
    public init() {
        super.init(title: "")
    }

    
    // MARK: - ActionSheetItemConvertible
    
    override func toActionSheetItem() -> ActionSheetItem {
        ActionSheetSectionMargin()
    }
}
