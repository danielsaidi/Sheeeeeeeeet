//
//  ViewController+PeekPop.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-12-02.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

extension ViewController: ActionSheetPeekSource {
    
    func actionSheet(at point: CGPoint) -> ActionSheet? {
        guard
            let view = tableView,
            let path = view.indexPathForRow(at: point)
            else { return nil }
        return actionSheet(at: path)
    }
    
    func presentationSourceView(at point: CGPoint) -> UIView? {
        guard
            let view = tableView,
            let path = view.indexPathForRow(at: point)
            else { return nil }
        return view.cellForRow(at: path)
    }
    
    func setCurrentActionSheet(_ sheet: ActionSheet) {
        actionSheet = sheet
    }
}
