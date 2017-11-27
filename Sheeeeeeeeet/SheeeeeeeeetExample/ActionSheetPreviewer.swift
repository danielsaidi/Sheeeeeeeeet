//
//  ActionSheetPreviewer.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

class ActionSheetPreviewer: NSObject, UIViewControllerPreviewingDelegate {
    
    
    // MARK: - Initialization
    
    init(vc: ViewController, sourceView: UIView) {
        self.vc = vc
        self.sourceView = sourceView
        super.init()
        if vc.traitCollection.forceTouchCapability == .available {
            vc.registerForPreviewing(with: self, sourceView: sourceView)
        }
    }
    
    
    // MARK: - Properties
    
    weak var cell: UITableViewCell?
    weak var vc: ViewController?
    weak var sourceView: UIView?
    
    
    // MARK: - Functions
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard
            let vc = vc,
            let tableView = vc.tableView,
            let indexPath = tableView.indexPathForRow(at: location),
            let cell = tableView.cellForRow(at: indexPath)
            else { return nil }
        
        self.cell = cell
        previewingContext.sourceRect = cell.frame
        return vc.actionSheet(at: indexPath)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        guard
            let vc = vc,
            let cell = cell,
            let sheet = viewControllerToCommit as? ActionSheet else { return }
        vc.actionSheet = sheet
        sheet.present(in: vc, from: cell)
    }
}
