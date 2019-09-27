//
//  Menu.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This struct represents a menu that consists of items, which
 can be items, buttons, toggles, titles etc.
 
 This is just a plain representation of any kind of menu. It
 can be used in many ways, e.g. mapped to an action sheet or
 a context menu, presented in a popover etc.
 */
open class Menu {
    
    public init(
        title: String? = nil,
        items: [MenuItem],
        configuration: Configuration = .standard) {
        self.title = title
        self.items = items
        self.configuration = configuration
    }
    
    public typealias ItemAction = (MenuItem) -> ()

    public let title: String?
    public private(set) var items: [MenuItem]
    public let configuration: Configuration
}

public extension Menu {
    
    /**
     Create empty menu, without any items.
     */
    static var empty: Menu {
        Menu(items: [])
    }
    
    /**
     Update the menu items.
     
     Use this function if you have to update the menu's item
     collection after creating the menu. This will be needed
     for some item types, e.g. `CollectionItem` where a menu
     item should trigger functions that affect the menu. For
     these cases, you must create the menu before the items.
     */
    func updateItems(_ items: [MenuItem]) {
        self.items = items
    }
}
