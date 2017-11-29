//
//  ActionSheetButtonHandler.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-29.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetButtonHandler: NSObject {
    
    
    // MARK: - Initialization
    
    init(actionSheet: ActionSheet) {
        self.actionSheet = actionSheet
    }
    
    
    // MARK: - Properties
    
    fileprivate weak var actionSheet: ActionSheet?
    
    fileprivate var buttons: [ActionSheetButton] {
        return actionSheet?.buttons ?? []
    }
}


// MARK: - UITableViewDataSource

extension ActionSheetButtonHandler: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttons.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return buttons[indexPath.row].cell(for: tableView)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(buttons[indexPath.row].appearance.height)
    }
}


// MARK: - UITableViewDelegate

extension ActionSheetButtonHandler: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let button = buttons[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        button.handleTap()
        actionSheet?.itemTapAction(button)
    }
}
