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
        configuration: ContextMenu.Configuration,
        previewProvider: UIContextMenuContentPreviewProvider? = nil,
        action: @escaping (MenuItem) -> ()) {
        self.menuCreator = menuCreator
        self.configuration = configuration
        self.action = action
        self.previewProvider = previewProvider
        super.init()
        setupDidEnterBackgroundDetection()
    }
    
    convenience init(
        menu: Menu,
        configuration: ContextMenu.Configuration,
        previewProvider: UIContextMenuContentPreviewProvider? = nil,
        action: @escaping (MenuItem) -> ()) {
        self.init(
            menuCreator: menu,
            configuration: configuration,
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
    let configuration: ContextMenu.Configuration
    let action: (MenuItem) -> ()
    let previewProvider: UIContextMenuContentPreviewProvider?
    
    weak var activeInteraction: UIContextMenuInteraction?
    var activeConfiguration: ContextMenu.Configuration?
    
    public var isCurrentlyPresented: Bool { return activeInteraction != nil }
    
    public func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(identifier: nil, previewProvider: previewProvider, actionProvider: { [weak self] _ in
            guard let self = self else {
                #if DEBUG
                print("ContextMenuDelegate was deallocated")
                #endif
                return nil
            }
            let menu = self.menuCreator.createMenu()
            switch menu.toContextMenu(action: self.action) {
            case .failure(let error): fatalError(error.localizedDescription)
            case .success(let contextMenu):
                self.activeInteraction = interaction
                self.activeConfiguration = self.configuration
                return contextMenu
            }
        })
    }
    
    public func contextMenuInteraction(_ interaction: UIContextMenuInteraction, willEndFor configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        activeInteraction = nil
        activeConfiguration = nil
    }
}


@available(iOS 13.0, *)
private extension ContextMenuDelegate {
    
    @objc func handleDidEnterBackground() {
        guard
            let config = activeConfiguration,
            config.shouldBeDismissedWhenEnteringBackground,
            let activeInteraction = activeInteraction,
            let activeView = activeInteraction.view
            else { return }
        
        activeView.removeInteraction(activeInteraction)
        activeView.addInteraction(activeInteraction)
    }
    
    func setupDidEnterBackgroundDetection(with center: NotificationCenter = .default) {
        let action = #selector(handleDidEnterBackground)
        let name = UIApplication.didEnterBackgroundNotification
        center.addObserver(self, selector: action, name: name, object: nil)
    }
}
