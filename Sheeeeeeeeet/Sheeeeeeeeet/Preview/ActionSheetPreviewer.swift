//
//  ActionSheetPreviewer.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetPreviewer: NSObject, UIViewControllerPreviewingDelegate {
    
    
    // MARK: - Typealias
    
    public typealias ActionSheetPreviewSourceViewController = UIViewController & ActionSheetPreviewSource
    
    
    // MARK: - Initialization
    
    public init(
        in vc: ActionSheetPreviewSourceViewController,
        sourceView: UIView,
        useLongPressIfPreviewIsUnsupported: Bool = true) {
        self.vc = vc
        self.sourceView = sourceView
        super.init()
        if vc.traitCollection.forceTouchCapability == .available {
            vc.registerForPreviewing(with: self, sourceView: sourceView)
        } else if useLongPressIfPreviewIsUnsupported {
            applyLongPressGesture(to: sourceView)
        }
    }
    
    
    // MARK: - Properties
    
    fileprivate(set) weak var vc: ActionSheetPreviewSourceViewController?
    fileprivate(set) weak var sourceView: UIView?
    
    fileprivate weak var presentationSourceView: UIView?
    
    
    // MARK: - Actions
    
    @objc func sourceViewLongPressed(gesture: UILongPressGestureRecognizer) {
        guard
            gesture.state == .began,
            let vc = vc,
            let sourceView = sourceView
            else { return }
        
        let location = gesture.location(in: sourceView)
        
        guard
            let sheet = vc.actionSheet(at: location),
            let presentationSourceView = vc.presentationSourceView(at: location)
            else { return }
        
        vc.actionSheet = sheet
        sheet.present(in: vc, from: presentationSourceView)
    }
    
    
    // MARK: - Private Functions
    
    fileprivate func applyLongPressGesture(to view: UIView) {
        view.isUserInteractionEnabled = true
        let action = #selector(sourceViewLongPressed(gesture:))
        let press = UILongPressGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(press)
    }
    
    
    // MARK: - UIViewControllerPreviewingDelegate
    
    open func previewingContext(
        _ previewingContext: UIViewControllerPreviewing,
        viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard
            let vc = vc,
            let sheet = vc.actionSheet(at: location),
            let sourceView = vc.presentationSourceView(at: location)
            else { return nil }
        self.presentationSourceView = sourceView
        previewingContext.sourceRect = sourceView.frame
        return sheet
    }
    
    open func previewingContext(
        _ previewingContext: UIViewControllerPreviewing,
        commit viewControllerToCommit: UIViewController) {
        guard
            let vc = vc,
            let sheet = viewControllerToCommit as? ActionSheet,
            let sourceView = presentationSourceView
            else { return }
        vc.actionSheet = sheet
        sheet.pop(in: vc, from: sourceView)
    }
}
