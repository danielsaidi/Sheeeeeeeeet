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
 context menu.
 
 If the context menu trigger view can't retain this delegate,
 you must keep a strong reference to it. If it's deallocated,
 the context menu will stop working.
 */
@available(iOS 13.0, *)
public class ContextMenuDelegate: NSObject, UIContextMenuInteractionDelegate {
    
    init(menu: Menu, action: @escaping (MenuItem) -> ()) {
        self.menu = menu
        self.action = action
    }
    
    deinit {
        print("deinit")
    }
    
    let menu: Menu
    let action: (MenuItem) -> ()
    
    public func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { [weak self] suggestedActions in
            guard let self = self else { fatalError("ContextMenuDelegate was deallocated") }
            switch self.menu.toContextMenu(action: self.action) {
            case .failure(let error): fatalError(error.localizedDescription)
            case .success(let menu): return menu
            }
        })
    }
}
