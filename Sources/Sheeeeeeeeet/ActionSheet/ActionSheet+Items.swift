//
//  ActionSheet+Items.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-16.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension ActionSheet {

    /**
     Get all action sheet items of a specific type.
     */
    func items<T: ActionSheetItem>(ofType type: T.Type) -> [T] {
        items.compactMap { $0 as? T }
    }
}
