//
//  ActionSheetButtonTableView.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This table view is used to present buttons within a sheet.
 */
open class ActionSheetButtonTableView: ActionSheetTableView {
    
    open override func fixXcodeAppearanceBug() {
        super.fixXcodeAppearanceBug()
        guard let color = ActionSheetButtonTableView.appearance().backgroundColor else { return }
        backgroundColor = color
    }
}
