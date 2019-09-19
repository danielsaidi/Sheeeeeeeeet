//
//  DemoColorfulAppearance.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

extension ActionSheetAppearance {
    
    /**
     Get an instance of the colorful demo appearance.
    */
    static var demoColorful: ActionSheetAppearance {
        DemoColorfulAppearance()
    }
}


/**
 This is a demo-specific action sheet appearance. It applies
 a bunch of colors to the demo sheets.
 */
class DemoColorfulAppearance: DemoAppearance {

    override func applyColors() {
        background.backgroundColor = UIColor.purple.withAlphaComponent(0.4)
        item.subtitleColor = .blue
        selectItem.selectedTintColor = .blue
        selectItem.selectedTitleColor = .green
        selectItem.selectedIconColor = .purple
        singleSelectItem.selectedTintColor = .green
        singleSelectItem.selectedTitleColor = .purple
        singleSelectItem.selectedIconColor = .blue
        multiSelectItem.selectedTintColor = .blue
        multiSelectItem.selectedTitleColor = .green
        multiSelectItem.selectedIconColor = .purple
        table.backgroundColor = .yellow
        itemsTable.backgroundColor = .brown
        itemsTable.separatorColor = .purple
        buttonsTable.separatorColor = .red
    }
    
    override func applyFonts() {
        item.titleFont = .robotoRegular(size: 17)
        item.subtitleFont = .robotoRegular(size: 14)
        link.titleFont = .robotoRegular(size: 17)
        multiSelectToggle.titleFont = .robotoMedium(size: 13)
        sectionTitle.titleFont = .robotoMedium(size: 14)
        title.titleFont = .robotoMedium(size: 15)
        okButton.titleFont = .robotoMedium(size: 17)
        dangerButton.titleFont = .robotoMedium(size: 17)
        cancelButton.titleFont = .robotoRegular(size: 17)
    }
}
