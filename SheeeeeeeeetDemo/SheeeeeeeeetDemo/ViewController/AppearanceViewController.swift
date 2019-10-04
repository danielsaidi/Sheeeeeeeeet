//
//  AppearanceViewController.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-08-13.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

class AppearanceViewController: ViewController {
    
    override var menuOptions: [MenuOption] {
        [
            .applyAppearance(.demo),
            .applyAppearance(.demoColorful)
        ]
    }
}
