//
//  ActionSheetPreviewer.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

class ActionSheetPreviewer: NSObject {
    
    
    // MARK: - Initialization
    
    init(vc: ViewController, sourceView: UIView) {
        self.vc = vc
        self.sourceView = sourceView
        super.init()
        if vc.traitCollection.forceTouchCapability == .available {
            vc.registerForPreviewing(with: self, sourceView: sourceView)
        } else {
            applyLongPressGesture(to: sourceView)
        }
    }
    
    
    // MARK: - Properties
    
    weak var cell: UITableViewCell?
    weak var vc: ViewController?
    weak var sourceView: UIView?
}


// MARK: - Actions

@objc extension ActionSheetPreviewer {
    
    func sourceViewLongPressed(gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began else { return }
        let location = gesture.location(in: sourceView)
        guard
            let vc = vc,
            let tableView = sourceView as? UITableView,
            let indexPath = tableView.indexPathForRow(at: location),
            let sheet = vc.actionSheet(at: indexPath)
            else { return }
        vc.actionSheet = sheet
        sheet.present(in: vc, from: cell)
    }
}


// MARK: - Private Functions

fileprivate extension ActionSheetPreviewer {
    
    func applyLongPressGesture(to sourceView: UIView) {
        sourceView.isUserInteractionEnabled = true
        let action = #selector(sourceViewLongPressed(gesture:))
        let longPress = UILongPressGestureRecognizer(target: self, action: action)
        sourceView.addGestureRecognizer(longPress)
    }
}


// MARK: - UIViewControllerPreviewingDelegate

extension ActionSheetPreviewer: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard
            let vc = vc,
            let view = sourceView as? UITableView,
            let path = view.indexPathForRow(at: location),
            let cell = view.cellForRow(at: path),
            let sheet = vc.actionSheet(at: path)
            else { return nil }
        self.cell = cell
        previewingContext.sourceRect = cell.frame
        return sheet
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        guard
            let vc = vc,
            let cell = cell,
            let sheet = viewControllerToCommit as? ActionSheet else { return }
        vc.actionSheet = sheet
        sheet.pop(in: vc, from: cell)
    }
}
