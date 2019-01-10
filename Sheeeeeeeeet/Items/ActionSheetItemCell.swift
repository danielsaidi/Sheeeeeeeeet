//
//  ActionSheetItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This is the base class for all different cell types in this
 library. It makes it possible to set a global appearance on
 all item cells, using `ActionSheetItemCell.appearance()`.
 
 */

import UIKit

open class ActionSheetItemCell: UITableViewCell {
    
    
    // MARK: - Layout
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.font = titleFont
        textLabel?.textColor = titleColor
        detailTextLabel?.font = subtitleFont
    }
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var titleColor: UIColor?
    @objc public dynamic var titleFont: UIFont?
    @objc public dynamic var subtitleFont: UIFont?
}
