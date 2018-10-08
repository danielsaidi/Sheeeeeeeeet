//
//  ViewController.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 To make the example easier to overview, the view controller
 has been split up into extension files.
 
 Action sheet appearance is setup by `AppDelegate` using the
 `DemoAppearance` class. You can play around with it to view
 how sheets and items are affected by appearance changes.
 
 */


import UIKit
import Sheeeeeeeeet

class ViewController: UIViewController {

    
    // MARK: - Properties
    
    var foodOptions: [FoodOption] {
        return [.fast, .light, .homeMade, .fancy, .none]
    }
    
    var tableViewOptions: [TableViewOption] = [
        .standard,
        .singleSelect,
        .multiSelect,
        .links,
        .headerView,
        .sections,
        .collections,
        .customView,
        .danger,
        .nonDismissable
    ]
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
}
