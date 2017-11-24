//
//  ActionSheetItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This class represents a regular action item, like the one
 you normally see in a UIAlertController.
 
 */

import UIKit

open class ActionSheetItem: NSObject {
    
    
    // MARK: - Initialization
    
    public init(value: Any, title: String, image: UIImage?) {
        self.value = value
        self.title = title
        self.image = image
        self.appearance = ActionSheetAppearance.standard.item
        super.init()
    }
    
    
    // MARK: - Properties
    
    open var appearance: ActionSheetItemAppearance
    open var value: Any
    open var image: UIImage?
    open var title: String
    
    open var height: Int {
        return appearance.height
    }
    
    
    // MARK: - Functions
    
    open func cell(for tableView: UITableView) -> UITableViewCell {
        let id = ActionSheetItemCell.className
        let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ActionSheetItemCell
            ?? ActionSheetItemCell(style: .default, reuseIdentifier: id)
        cell.apply(appearance: appearance)
        cell.imageView?.image = image
        cell.textLabel?.text = title
        return cell
    }
}

