//
//  ActionSheetPreviewer.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

class ActionSheetPreviewer<T: UIViewController & ActionSheetPreviewSource>: NSObject, UIViewControllerPreviewingDelegate {
    
    
    // MARK: - Initialization
    
    init(vc: T, sourceView: UIView) {
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
    
    weak var vc: T?
    weak var sourceView: UIView?
    weak var previewSourceView: UIView?
    
    // MARK: - Actions

    @objc func sourceViewLongPressed(gesture: UILongPressGestureRecognizer) {
        guard gesture.state == .began else { return }
        let location = gesture.location(in: sourceView)
        guard
            let vc = vc,
            let sheet = vc.actionSheet(at: location),
            let previewSourceView = vc.previewSourceView(for: location)
            else { return }
        vc.actionSheet = sheet
        sheet.present(in: vc, from: previewSourceView)
    }

    
    // MARK: - Private Functions
    
    func applyLongPressGesture(to sourceView: UIView) {
        sourceView.isUserInteractionEnabled = true
        let action = #selector(sourceViewLongPressed(gesture:))
        let longPress = UILongPressGestureRecognizer(target: self, action: action)
        sourceView.addGestureRecognizer(longPress)
    }


    // MARK: - UIViewControllerPreviewingDelegate
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard
            let vc = vc,
            let sheet = vc.actionSheet(at: location),
            let previewSourceView = vc.previewSourceView(for: location)
            else { return nil }
        self.previewSourceView = previewSourceView
        previewingContext.sourceRect = previewSourceView.frame
        return sheet
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        guard
            let vc = vc,
            let previewSourceView = previewSourceView,
            let sheet = viewControllerToCommit as? ActionSheet else { return }
        vc.actionSheet = sheet
        sheet.pop(in: vc, from: previewSourceView)
    }
}
