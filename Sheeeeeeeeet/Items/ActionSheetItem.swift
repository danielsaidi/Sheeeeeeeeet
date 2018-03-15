//
//  ActionSheetItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents a regular action sheet item, like the
 ones used in UIAlertController. It has a title, an optional
 value and an optional image. All other item classes inherit
 this class.
 
 The default tap behavior of action sheet items is "dismiss",
 which means that the action sheet is told that the item was
 tapped and is then dismissed. If you don't want the item to
 dismiss the action sheet, set `tapBehavior` to `.none`.
 
 An action sheet item's appearance is set by the sheet, when
 it is presented. To use custom appearances for single items,
 just modify the item's `appearance` property.
 
 */

import UIKit

open class ActionSheetItem: NSObject {
    
    
    // MARK: - Initialization
    
    public init(title: String, subtitle: String? = nil, value: Any? = nil, image: UIImage? = nil) {
        let appearance = ActionSheetAppearance.standard.item
        self.title = title
        self.value = value
        self.image = image
        self.subtitle = subtitle
        self.appearance = ActionSheetItemAppearance(copy: appearance)
        super.init()
    }
    
    
    // MARK: - Tap Behavior
    
    public enum TapBehavior {
        case dismiss, none
    }


    // MARK: - Properties
    
    open var image: UIImage?
    open var subtitle: String?
    open var title: String
    open var value: Any?

    open var appearance: ActionSheetItemAppearance
    open var tapBehavior = TapBehavior.dismiss
    
    
    // MARK: - Functions
    
    open func applyAppearance(_ appearance: ActionSheetAppearance) {
        self.appearance = ActionSheetItemAppearance(copy: appearance.item)
    }
    
    open func applyAppearance(to cell: UITableViewCell) {
        cell.imageView?.image = image
        cell.textLabel?.text = title
        cell.separatorInset = appearance.separatorInsets
        cell.tintColor = appearance.tintColor
        cell.textLabel?.textColor = appearance.textColor
        cell.textLabel?.font = appearance.font
        cell.detailTextLabel?.text = subtitle
        cell.detailTextLabel?.font = appearance.subtitleFont
        cell.detailTextLabel?.textColor = appearance.subtitleTextColor
    }
    
    open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = type(of: self).className
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ActionSheetItemCell
            ?? ActionSheetItemCell(style: .value1, reuseIdentifier: id)
        applyAppearance(to: cell)
        return cell
    }
    
    open func handleTap(in actionSheet: ActionSheet?) {}
    
    open func handleTap(in cell: UITableViewCell?) {}
}
