//
//  ActionSheetItemTableView.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-11.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetItemTableView: ActionSheetTableView {
    
    open override func fixXcodeAppearanceBug() {
        backgroundColor = ActionSheetItemTableView.appearance().backgroundColor
    }
}
