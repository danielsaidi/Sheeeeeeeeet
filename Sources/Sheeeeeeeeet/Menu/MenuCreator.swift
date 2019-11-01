//
//  ContextMenuBuilder.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-11-01.
//

import Foundation

/**
 This protocol can be used whenever menus can be potentially
 expensive to create. It lets you postpone the menu creation
 until when it's needed.
 */
public protocol MenuCreator {
    
    func createMenu() -> Menu
}
