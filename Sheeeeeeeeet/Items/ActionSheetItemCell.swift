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
    
    open override func didMoveToWindow() {
        super.didMoveToWindow()
        refresh()
    }
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var titleColor: UIColor?
    @objc public dynamic var titleFont: UIFont?
    @objc public dynamic var subtitleColor: UIColor?
    @objc public dynamic var subtitleFont: UIFont?
    
    
    // MARK: - Private Properties
    
    public private(set) weak var item: ActionSheetItem?
    
    
    // MARK: - Functions
    
    open func refresh() {
        guard let item = item else { return }
        let noTap = item.tapBehavior == .none
        imageView?.image = item.image
        selectionStyle = noTap ? .none : .default
        textLabel?.font = titleFont
        textLabel?.text = item.title
        textLabel?.textAlignment = .left
        textLabel?.textColor = titleColor
        detailTextLabel?.font = subtitleFont
        detailTextLabel?.text = item.subtitle
        detailTextLabel?.textColor = subtitleColor
    }
    
    open func refresh(with item: ActionSheetItem) {
        self.item = item
        refresh()
    }
}
