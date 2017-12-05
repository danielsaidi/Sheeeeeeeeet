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
 
 The default peek behavior is to only peek an action sheet's
 header view, then display the full sheet once the user pops.
 You can change this by injecting another behavior in `init`.
 
 For devices that lack 3D touch preview support, you can let
 the peek handler support long press as a fallback option. A
 long press will not peek the sheet, but display it directly.
 The default behavior is to enable this behavior. To disable
 it, set `longPressFallback` to `false` in init.
 
 */

import UIKit

open class ActionSheetPeekHandler: NSObject, UIViewControllerPreviewingDelegate {
    
    
    // MARK: - Initialization
    
    public init(
        in vc: UIViewController,
        peekSource: ActionSheetPeekSource,
        sourceView: UIView,
        peekBehavior: ActionSheetPeekBehavior = .header,
        longPressFallback: Bool = true) {
        self.vc = vc
        self.peekSource = peekSource
        self.sourceView = sourceView
        self.peekBehavior = peekBehavior
        super.init()
        
        if vc.traitCollection.forceTouchCapability == .available {
            vc.registerForPreviewing(with: self, sourceView: sourceView)
        } else if longPressFallback {
            applyLongPressGesture(to: sourceView)
        }
    }
    
    
    // MARK: - Properties
    
    fileprivate(set) public var peekBehavior: ActionSheetPeekBehavior
    fileprivate(set) weak var peekSource: ActionSheetPeekSource?
    fileprivate(set) weak var sourceView: UIView?
    fileprivate(set) weak var vc: UIViewController?
    
    fileprivate var popButtons = [ActionSheetButton]()
    fileprivate var popItems = [ActionSheetItem]()
    fileprivate weak var presentationSourceView: UIView?
    
    
    // MARK: - UIViewControllerPreviewingDelegate
    
    open func previewingContext(
        _ previewingContext: UIViewControllerPreviewing,
        viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard
            let sheet = peekSource?.actionSheet(at: location),
            let view = peekSource?.presentationSourceView(at: location),
            shouldPeek(sheet)
            else { return nil }
        prepareSheetForPeek(sheet)
        self.presentationSourceView = view
        previewingContext.sourceRect = view.frame
        return sheet
    }
    
    open func previewingContext(
        _ previewingContext: UIViewControllerPreviewing,
        commit viewControllerToCommit: UIViewController) {
        guard
            let vc = vc,
            let sheet = viewControllerToCommit as? ActionSheet,
            let view = presentationSourceView
            else { return }
        prepareSheetForPop(sheet)
        peekSource?.setCurrentActionSheet(sheet)
        let presenter = ActionSheetPopPresenter()
        sheet.present(in: vc, from: view, with: presenter)
    }
}


// MARK: - Actions

@objc extension ActionSheetPeekHandler {
    
    func sourceViewLongPressed(gesture: UILongPressGestureRecognizer) {
        guard
            let vc = vc,
            let point = longPressLocation(for: gesture),
            let sheet = peekSource?.actionSheet(at: point),
            let view = peekSource?.presentationSourceView(at: point)
            else { return }
        peekSource?.setCurrentActionSheet(sheet)
        sheet.present(in: vc, from: view)
    }
}


// MARK: - Private Functions

fileprivate extension ActionSheetPeekHandler {
    
    func applyLongPressGesture(to view: UIView) {
        view.isUserInteractionEnabled = true
        let action = #selector(sourceViewLongPressed(gesture:))
        let press = UILongPressGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(press)
    }
    
    func longPressLocation(for gesture: UILongPressGestureRecognizer) -> CGPoint? {
        guard gesture.state == .began else { return nil }
        return gesture.location(in: sourceView ?? UIView())
    }
    
    func prepareSheetForPeek(_ sheet: ActionSheet) {
        popItems = sheet.items
        popButtons = sheet.buttons
        switch peekBehavior {
        case .header: sheet.setupItemsAndButtons(with: [])
        case .sheet: return
        }
    }
    
    func prepareSheetForPop(_ sheet: ActionSheet) {
        if peekBehavior == .header {
            sheet.items = popItems
            sheet.buttons = popButtons
        }
        popItems = []
        popButtons = []
    }
    
    func shouldPeek(_ sheet: ActionSheet) -> Bool {
        switch peekBehavior {
        case .header: return sheet.headerView != nil
        case .sheet: return true
        }
    }
}
