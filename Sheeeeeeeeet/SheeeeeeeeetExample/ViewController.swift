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
 handled here to simplify the example.
 
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
    
    var actionSheet: ActionSheet?
    
    
    // MARK: -
    
    
    
    
    
    
    @IBAction func showActionSheet(_ sender: Any) {
        actionSheet = standardActionSheet { item in
            print(item.value)
        }
        
        //actionSheet?.headerView?.backgroundColor = .red
        actionSheet?.present(in: self, from: sender as? UIView)
    }
}


// MARK: - Private Functions

fileprivate extension ViewController {
    
    func applyActionSheetAppearance() {
        let appearance = ActionSheetAppearance.standard
        
        appearance.title.separatorInsets.right = .greatestFiniteMagnitude
        
        
        
    }
}
