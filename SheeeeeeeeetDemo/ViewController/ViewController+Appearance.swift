//
//  ViewController+Options.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2019-02-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet

extension ViewController {
    
    /**
     Get the appearance option at a certain index, if any.
     */
    func appearance(at indexPath: IndexPath) -> ActionSheetAppearance? {
        switch menuOption(at: indexPath) {
        case .openSheet, .separator: return nil
        case .applyAppearance(.demo): return DemoAppearance()
        case .applyAppearance(.demoColorful): return DemoColorfulAppearance()
        }
    }
}
