//
//  ActionSheetLinkItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetLinkItemCell: ActionSheetItemCell {
    
    
    // MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if accessoryView != nil { return }                  // TODO: Fix this in another way
        accessoryView = UIImageView(image: linkIcon)
    }
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var linkIcon: UIImage?
}
