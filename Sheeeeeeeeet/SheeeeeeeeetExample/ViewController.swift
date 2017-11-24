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
        
        let item = ActionSheetItem(value: "foo", title: "gea", image: nil, appearance: ActionSheetAppearance.standard.item)
        /*ActionSheetAppearance.standard.header.headerHeight = 100
        let header = ActionSheetHeader(title: "foo", frame: .zero)
        print(ActionSheetAppearance.standard.header.headerHeight)*/
        
    }
}
