//
//  ActionSheetItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit


/**
 This class represents a regular action sheet item when it's
 used within custom `ActionSheet`.
 
 Customizing the appearance of the various action sheet item
 cells in Sheeeeeeeeet (as well as of your own custom items),
 is mainly done using the iOS appearance proxy for each item
 cell type. For instance, to change the title text color for
 all `ActionSheetSelectItem` instances (including subclasses),
 set the `ActionSheetSelectItemCell.appearance().titleColor`
 property to the color you want to use.
 
 While most appearance is modified on a cell level, some are
 not. For instance, some views in `Views` have apperances of
 as well (e.g. `ActionSheetHeaderContainerView.cornerRadius`).
 This means that you can change the appearance for more view
 types than cells. Check out at the readmes and demo app for
 more information.
 
 Action sheet insets, margins and widths are not part of the
 appearance model, but have to be changed for each sheet. If
 you want to change these values for all sheets in an app, I
 recommend subclassing `ActionSheet`.
 
 Item heights are not part of the appearance model, but must
 for now be set for each `MenuItem` type you want to adjust.
 For instance, `MenuButton.height = 20` resizes every button
 in a menu.
 */
open class ActionSheetItemCell: UITableViewCell {
    
    
    // MARK: - Initialization
    
    public convenience init(style: UITableViewCell.CellStyle) {
        let reuseIdentifier = type(of: self).className
        self.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    // MARK: - Layout
    
    open override func didMoveToWindow() {
        super.didMoveToWindow()
        fixSeparatorLineBugOnOlderDevices()
        refresh()
    }
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var height: Double = 0
    @objc public dynamic var itemTextAlignment: NSTextAlignment = .left
    
    @objc public dynamic var titleColor: UIColor?
    @objc public dynamic var titleFont: UIFont?
    @objc public dynamic var subtitleColor: UIColor?
    @objc public dynamic var subtitleFont: UIFont?
    
    @objc public dynamic var disabledTitleColor: UIColor?
    @objc public dynamic var disabledSubtitleColor: UIColor?
    @objc public dynamic var disabledTintColor: UIColor?
    
    
    // MARK: - Private Properties
    
    public private(set) weak var item: MenuItem?
    
    
    // MARK: - Functions
    
    open func fixSeparatorLineBugOnOlderDevices() {
        if #available(iOS 10.0, *) {} else {
            preservesSuperviewLayoutMargins = false
            layoutMargins = .zero
        }
    }
    
    open func refresh() {
        guard let item = item else { return }
        isUserInteractionEnabled = item.isEnabled
        if !item.isEnabled { tintColor = disabledTintColor }
        imageView?.image = item.image
        selectionStyle = item.tapBehavior == .none ? .none : .default
        textLabel?.font = titleFont
        textLabel?.text = item.title
        textLabel?.textAlignment = itemTextAlignment
        textLabel?.textColor = item.isEnabled ? titleColor : disabledTitleColor
        detailTextLabel?.font = subtitleFont
        detailTextLabel?.text = item.subtitle
        detailTextLabel?.textColor = item.isEnabled ? subtitleColor : disabledSubtitleColor
        detailTextLabel?.textAlignment = itemTextAlignment
    }
    
    func refresh(with item: MenuItem) {
        self.item = item
        refresh()
    }
}
