//
//  SingleSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 `SingleSelectItem` should be used whenever a user should be
 able to select a single item within a menu or menu group.
 
 This item automatically deselects other single-select items
 in the same group when it's tapped. You can use many groups
 within a menu.
 
 A single select item will by default dismiss the sheet when
 it's tapped. To change this, set `tapBehavior` to `.none`.
 */
open class SingleSelectItem: SelectItem {}
