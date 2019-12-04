//
//  ContextMenuDelegate.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This class is created whenever a view applies a `Menu` as a
 context menu. It must be retained by the caller.
 
 If the context menu trigger view can't retain this delegate,
 you must keep a strong reference to it. If it's deallocated,
 the context menu will stop working.
 */
@available(iOS 13.0, *)
public class ContextMenuDelegate: NSObject, UIContextMenuInteractionDelegate {
    
    init(
        menuCreator: MenuCreator,
        previewProvider: UIContextMenuContentPreviewProvider? = nil,
        action: @escaping (MenuItem) -> ()) {
        self.menuCreator = menuCreator
        self.action = action
        self.previewProvider = previewProvider
        super.init()
        setupDidEnterBackgroundDetection()
    }
    
    convenience init(
        menu: Menu,
        previewProvider: UIContextMenuContentPreviewProvider? = nil,
        action: @escaping (MenuItem) -> ()) {
        self.init(
            menuCreator: menu,
            previewProvider: previewProvider,
            action: action
        )
    }
    
    deinit {
        #if DEBUG
        print("Deinitialized ContextMenuDelegate")
        #endif
    }
    
    let menuCreator: MenuCreator
    let action: (MenuItem) -> ()
    let previewProvider: UIContextMenuContentPreviewProvider?
    
    weak var activeInteraction: UIContextMenuInteraction?
    var activeMenuConfiguration: Menu.Configuration?
    
    public func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(identifier: nil, previewProvider: previewProvider, actionProvider: { [weak self] _ in
            guard let self = self else { fatalError("ContextMenuDelegate was deallocated") }
            let menu = self.menuCreator.createMenu()
            switch menu.toContextMenu(action: self.action) {
            case .failure(let error): fatalError(error.localizedDescription)
            case .success(let contextMenu):
                self.activeInteraction = interaction
                self.activeMenuConfiguration = menu.configuration
                return contextMenu
            }
        })
    }
}


@available(iOS 13.0, *)
private extension ContextMenuDelegate {
    
    @objc func handleDidEnterBackground() {
        guard let config = activeMenuConfiguration,
            config.isDismissable && config.shouldDismissOnDidEnterBackground else { return }
        
        guard let activeInteraction = activeInteraction,
            let activeView = activeInteraction.view else { return }
        
        activeView.removeInteraction(activeInteraction)
        activeView.addInteraction(activeInteraction)
    }
    
    func setupDidEnterBackgroundDetection(with center: NotificationCenter = .default) {
        let action = #selector(handleDidEnterBackground)
        let name = UIApplication.didEnterBackgroundNotification
        center.addObserver(self, selector: action, name: name, object: nil)
    }
}
