//
//  ActionSheetItemDelegate.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetItemDelegate: NSObject, UITableViewDelegate {
    
    
    // MARK: - Initialization
    
    init(actionSheet: ActionSheet) {
        self.actionSheet = actionSheet
    }
    
    
    // MARK: - Properties
    
    fileprivate weak var actionSheet: ActionSheet?
    
    
    // MARK: - UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let item = actionSheet?.item(at: indexPath) else { return 0 }
        return CGFloat(item.appearance.height)
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = actionSheet?.item(at: indexPath) else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        item.handleTap()
        actionSheet?.itemTapAction(item)
    }
}
