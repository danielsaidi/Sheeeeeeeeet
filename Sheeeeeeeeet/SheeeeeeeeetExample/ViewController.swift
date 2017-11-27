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
    
    fileprivate var tableViewOptions: [TableViewOption] = [
        .standard,
        .singleSelect,
        .multiSelect,
        .toggle,
    ]
    
    func foodOptions() -> [FoodOption] {
        return [.fast, .light, .homeMade, .fancy, .none]
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
    
    
    // MARK: - Actions
    
    func actionSheetItemTapped(_ sheet: ActionSheet, _ item: ActionSheetItem) {
        guard item.value != nil else { return }
        alert(item: item)
    }
    
    func multiSelectionSubmitted(_ sheet: ActionSheet, _ item: ActionSheetItem) {
        guard item.tapBehavior == .dismiss else { return }
        
        alert(item: item)
    }
}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewOptions.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Action Sheet Examples"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = tableViewOptions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = option.displayName
        return cell
    }
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        switch tableViewOptions[indexPath.row] {
        case .standard: actionSheet = standardActionSheet()
        case .singleSelect: actionSheet = singleSelectActionSheet(preselected: .fancy)
        case .multiSelect: actionSheet = multiSelectActionSheet(preselected: [.fancy, .fast])
        case .toggle: actionSheet = toggleActionSheet(preselected: [.fancy, .fast])
        }
        
        actionSheet?.present(in: self, from: cell)
    }
    
}
