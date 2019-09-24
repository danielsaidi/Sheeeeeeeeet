//
//  DemoCustomViewCell.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2018-10-08.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

/**
 This cell is used by the `CustomMenu` to resolve a view for
 the menu's action sheet.
 */
class DemoCustomViewCell: ActionSheetItemCell, CustomItemType {
    
    static let preferredSize = CGSize(width: 100, height: 400)
    
    var buttonTapAction: ((UIButton) -> ())?
    
    @IBAction func buttonTapAction(_ sender: UIButton) {
        buttonTapAction?(sender)
    }
}
