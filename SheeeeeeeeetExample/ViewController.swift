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
        setupPreviewHandling(with: .sheet)
    }
    
    
    // MARK: - Properties
    
    var actionSheet: ActionSheet?
    
    var actionSheetPeekHandler: ActionSheetPeekHandler?
    
    var tableViewOptions: [TableViewOption] = [
        .standard,
        .singleSelect,
        .multiSelect,
        .toggle,
        .links,
        .headerView,
        .sections,
        .danger,
        .peekPop,
        .peekPopSheet,
        .peekPopHeader
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
    
    
    // MARK: - Functions
    
    func actionSheet(at indexPath: IndexPath) -> ActionSheet? {
        switch tableViewOptions[indexPath.row] {
        case .standard: return standardActionSheet()
        case .singleSelect: return singleSelectActionSheet(preselected: .fancy)
        case .multiSelect: return multiSelectActionSheet(preselected: [.fancy, .fast])
        case .toggle: return toggleActionSheet(preselected: [.fancy, .fast])
        case .links: return linkActionSheet()
        case .headerView: return headerViewActionSheet()
        case .sections: return sectionActionSheet()
        case .danger: return destructiveActionSheet()
        default: return nil
        }
    }
    
    func handleNonSheetOption(_ option: TableViewOption) {
        switch option {
        case .peekPopHeader: setupPreviewHandling(with: .header)
        case .peekPopSheet: setupPreviewHandling(with: .sheet)
        default: return
        }
        alert(option: option)
    }
}


// MARK: - Private Functions

fileprivate extension ViewController {
    
    func setupPreviewHandling(with peekBehavior: ActionSheetPeekBehavior) {
        guard let view = tableView else { return }
        actionSheetPeekHandler = ActionSheetPeekHandler(
            in: self,
            peekSource: self,
            sourceView: view,
            peekBehavior: peekBehavior)
    }
}
