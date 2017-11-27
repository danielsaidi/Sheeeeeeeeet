//
//  ViewController+StandardSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

extension ViewController {
    
    func standardActionSheet(action: @escaping ActionSheetItemSelectAction) -> ActionSheet {
        let title = ActionSheetTitle(title: "Pick your favorite food")
        let item1 = ActionSheetItem(title: "Something fast", value: "Fast food", image: UIImage(named: "ic_pizza"))
        let item2 = ActionSheetItem(title: "Something home-made", value: "Home made", image: UIImage(named: "ic_grocery"))
        let item3 = ActionSheetItem(title: "Something fancy", value: "Fine dining", image: UIImage(named: "ic_fine_dining"))
        let item4 = ActionSheetItem(title: "I don't eat", value: "Nothing", image: UIImage(named: "ic_drink"))
        let items = [title, item1, item2, item3, item4]
        return ActionSheet(items: items, action: action)
    }
}
