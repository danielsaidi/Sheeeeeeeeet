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
    
    static var demoColorful: ActionSheetAppearance {
        DemoColorfulAppearance()
    }
}

class DemoColorfulAppearance: DemoAppearance {

    override func applyColors() {
        background.backgroundColor = .purple
        item.subtitleColor = .demoBlue
        selectItem.selectedTintColor = .demoBlue
        selectItem.selectedTitleColor = .demoGreen
        selectItem.selectedIconColor = .demoPurple
//        singleSelectItem.selectedTintColor = .demoGreen
//        singleSelectItem.selectedTitleColor = .demoPurple
//        singleSelectItem.selectedIconColor = .demoBlue
        table.separatorColor = .purple
        ActionSheetTableView.appearance(whenContainedInInstancesOf: [MultiSelectActionSheet.self]).cornerRadius = 30
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
