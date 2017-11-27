//
//  ViewController.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 Action sheet appearance should be configured as globally as
 possible, e.g. by a bootstrapper when the app starts. It is
 handled here to simplify understanding the example.
 
 To make the example easier to overview, the view controller
 has been split up in many smaller files.
 
 */

import UIKit
import Sheeeeeeeeet

class ViewController: UIViewController {

    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyActionSheetAppearance()
    }
    
    
    // MARK: - Properties
    
    fileprivate var actionSheet: ActionSheet?
    fileprivate var actionSheetItems: [ActionSheetItem]?
    
    
    // MARK: - Actions
    
    func actionSheetItemTapped(_ sheet: ActionSheet, _ item: ActionSheetItem) {
        guard item.value != nil else { return }
        alert(item: item)
    }
    
    func multiSelectionSubmitted(_ sheet: ActionSheet, _ item: ActionSheetItem) {
        guard item.tapBehavior == .dismiss else { return }
        
        alert(item: item)
    }
    
    
    
    
    @IBAction func showActionSheet(_ sender: Any) {
        actionSheet = createDefaultActionSheet(action: actionSheetItemTapped)
        
        //actionSheet?.headerView?.backgroundColor = .red
        actionSheet?.present(in: self, from: sender as? UIView)
    }
}
