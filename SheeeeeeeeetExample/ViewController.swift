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

    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DemoAppearance.apply()
        setupPreviewHandling(with: .sheet)
    }
    
    
    // MARK: - Properties
    
    var actionSheetPeekHandler: ActionSheetPeekHandler?
    
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
        .danger,
        .peekPopSheet,
        .peekPopHeader
    ]
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
}


// MARK: - Public Functions

extension ViewController {
    
    func actionSheet(at indexPath: IndexPath) -> ActionSheet? {
        let options = foodOptions
        switch tableViewOptions[indexPath.row] {
        case .collections: return CollectionActionSheet(options: options, action: alert)
        case .danger: return DestructiveActionSheet(options: options, action: alert)
        case .headerView: return HeaderActionSheet(options: options, action: alert)
        case .links: return LinkActionSheet(options: options, action: alert)
        case .multiSelect: return MultiSelectActionSheet(options: options, preselected: [.fancy, .fast], action: alert)
        case .sections: return SectionActionSheet(options: options, action: alert)
        case .singleSelect: return SingleSelectActionSheet(options: options, preselected: [.fancy, .fast], action: alert)
        case .standard: return StandardActionSheet(options: options, action: alert)
        default: return nil
        }
    }
    
    func handleNonSheetOption(_ option: TableViewOption) {
        switch option {
        case .peekPopHeader: setupPreviewHandling(with: .header)
        case .peekPopSheet: setupPreviewHandling(with: .sheet)
        default: break
        }
        alert(option: option)
    }
    
    func setupPreviewHandling(with peekBehavior: ActionSheetPeekBehavior) {
        guard let view = tableView else { return }
        actionSheetPeekHandler = ActionSheetPeekHandler(
            in: self,
            peekSource: self,
            sourceView: view,
            peekBehavior: peekBehavior)
    }
}
