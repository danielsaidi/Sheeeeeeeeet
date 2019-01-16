//
//  ActionSheet+Items.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-16.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This extension can be used to easily extract all items of a
 specific type.
 
 */

import UIKit

public extension ActionSheet {

    func items<T: ActionSheetItem>(ofType type: T.Type) -> [T] {
        return items.compactMap { $0 as? T }
    }
}
