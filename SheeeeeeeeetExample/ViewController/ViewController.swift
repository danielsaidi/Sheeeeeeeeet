//
//  ViewController.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This is the main view controller in the example app. It has
 a table view that lets you open different action sheets. To
 make the example app easier to overview, this class defines
 its logic in multiple files, using extensions.
 
 */


import UIKit
import Sheeeeeeeeet

class ViewController: UIViewController {

    
    // MARK: - Properties
    
    var foodOptions: [FoodOption] {
        return [.fast, .light, .homeMade, .fancy, .none]
    }
    
    var tableViewOptions: [MenuOption] = [
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
    
    @IBAction func testBarButtonTapped(_ sender: UIBarButtonItem) {
        let path = IndexPath(row: 1, section: 0)
        guard let sheet = actionSheet(at: path) else { return }
        sheet.present(in: self, from: sender)
    }
}
