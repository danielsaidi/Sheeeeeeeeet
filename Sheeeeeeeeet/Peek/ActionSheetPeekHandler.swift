//
//  ActionSheetPeekHandler.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This class can be used to add 3D touch action sheet peek to
 any view controller that implements `ActionSheetPeekSource`.
 Just create a strong reference instance of the class in the
 view controller and peek will work right away.
 
 A view controller can allow peeks from many different views.
 Just create one `ActionSheetPeekHandler` instance for every
 source view.
 
 For devices that lack 3D touch preview support, you can let
 the peek handler support long press as a fallback option. A
 long press will not peek the sheet, but display it directly.
 The default behavior is to enable this behavior. To disable
 it, set `longPressFallback` to `false` in init.
 
 */

import UIKit

open class ActionSheetPeekHandler: NSObject, UIViewControllerPreviewingDelegate {
    
    
    // MARK: - Typealias
    
    public typealias ActionSheetPeekSourceViewController = UIViewController & ActionSheetPeekSource
    
    
    // MARK: - Initialization
    
    public init(
        in vc: ActionSheetPeekSourceViewController,
        sourceView: UIView,
        longPressFallback: Bool = true) {
        self.vc = vc
        self.sourceView = sourceView
        super.init()
        if vc.traitCollection.forceTouchCapability == .available {
            vc.registerForPreviewing(with: self, sourceView: sourceView)
        } else if longPressFallback {
            applyLongPressGesture(to: sourceView)
        }
    }
    
    
    // MARK: - Properties
    
    fileprivate(set) weak var vc: ActionSheetPeekSourceViewController?
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
        
        vc.setCurrentActionSheet(sheet)
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
        vc.setCurrentActionSheet(sheet)
        let presenter = ActionSheetPopPresenter()
        sheet.present(in: vc, from: sourceView, with: presenter)
    }
}
