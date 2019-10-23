//
//  ContextMenuDelegateRetainer.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-25.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by any classes that can be
 used to retain a context menu delegate.
 */
public protocol ContextMenuDelegateRetainer: AnyObject {

    var contextMenuDelegate: Any? { get set }
}
