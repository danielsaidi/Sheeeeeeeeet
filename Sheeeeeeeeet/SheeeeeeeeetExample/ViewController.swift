//
//  ViewController.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

class ViewController: UIViewController {

    @IBAction func showActionSheet(_ sender: Any) {
        
        ActionSheetAppearance.standard.item.textColor = .blue
        //ActionSheetAppearance.standard.selectItem.selectedTextColor = .red
        
        
        let item1 = ActionSheetItem(value: "foo", title: "foo", image: nil)
        let item2 = ActionSheetSelectItem(value: 4, title: "bar", image: nil, isSelected: true)
        let item3 = ActionSheetSelectItem(value: 5, title: "baz", image: nil, isSelected: false)
        let actionSheet = ActionSheet(items: [item1, item2, item3], presenter: PopoverActionSheetPresenter())
        actionSheet.present(in: self, from: sender as? UIView)
        print(actionSheet.contentHeight)
    }
}
