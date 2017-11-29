//
//  ActionSheetItemHandler.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetItemHandler: NSObject {
    
    
    // MARK: - Initialization
    
    init(actionSheet: ActionSheet) {
        self.actionSheet = actionSheet
    }
    
    
    // MARK: - Properties
    
    fileprivate weak var actionSheet: ActionSheet?
    
    fileprivate var items: [ActionSheetItem] {
        return actionSheet?.items ?? []
    }
}


// MARK: - UITableViewDataSource

extension ActionSheetItemHandler: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return items[indexPath.row].cell(for: tableView)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(items[indexPath.row].appearance.height)
    }
}


// MARK: - UITableViewDelegate

extension ActionSheetItemHandler: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        item.handleTap()
        actionSheet?.itemTapAction(item)
    }
}
