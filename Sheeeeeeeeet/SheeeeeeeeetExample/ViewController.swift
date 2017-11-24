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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*ActionSheetAppearance.standard.header.headerHeight = 100
        let header = ActionSheetHeader(title: "foo", frame: .zero)
        print(ActionSheetAppearance.standard.header.headerHeight)*/
        
    }
    @IBAction func showActionSheet(_ sender: Any) {
        
        let item1 = ActionSheetItem(value: "foo", title: "foo", image: nil)
        let item2 = ActionSheetItem(value: 4, title: "bar", image: nil)
        let actionSheet = ActionSheet(items: [item1, item2], presenter: PopoverActionSheetPresenter())
        actionSheet.present(in: self, from: sender as? UIView)
    }
}
