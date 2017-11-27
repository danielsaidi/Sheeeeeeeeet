//
//  ActionSheetDataSource.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetDataSource: NSObject, UITableViewDataSource {
    
    
    // MARK: - Initialization
    
    init(actionSheet: ActionSheet) {
        self.actionSheet = actionSheet
    }
    
    
    // MARK: - Properties
    
    fileprivate weak var actionSheet: ActionSheet?
    
    
    // MARK: - UITableViewDataSource

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionSheet?.items.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = actionSheet?.item(at: indexPath)
        return item?.cell(for: tableView) ?? UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = actionSheet?.item(at: indexPath)
        return CGFloat(item?.appearance.height ?? 0)
    }
}
