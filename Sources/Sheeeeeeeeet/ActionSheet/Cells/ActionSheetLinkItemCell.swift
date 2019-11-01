//
//  ActionSheetLinkItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetLinkItemCell: ActionSheetItemCell {
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var linkIcon: UIImage?
    
    
    // MARK: - Functions
    
    open override func refresh() {
        super.refresh()
        accessoryView = UIImageView(image: linkIcon)
    }
}
