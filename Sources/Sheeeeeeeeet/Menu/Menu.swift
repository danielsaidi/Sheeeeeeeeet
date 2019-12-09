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
        items: [MenuItem]) {
        self.title = title
        self.items = items
    }
    
    public typealias ItemAction = (MenuItem) -> ()

    public let title: String?
    public let items: [MenuItem]
}

extension Menu: MenuCreator {
    
    /**
     Implement `MenuCreator` by returning itself.
     */
    public func createMenu() -> Menu { self }
}

public extension Menu {
    
    /**
     Create an empty menu, without any items.
     */
    static var empty: Menu {
        Menu(items: [])
    }
}
