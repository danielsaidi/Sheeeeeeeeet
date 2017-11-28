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
        setupPeekAndPop()
    }
    
    
    // MARK: - Properties
    
    var actionSheet: ActionSheet?
    
    var actionSheetPreviewer: ActionSheetPreviewer<ViewController>?
    
    var tableViewOptions: [TableViewOption] = [
        .standard,
        .singleSelect,
        .multiSelect,
        .toggle,
        .links,
        .headerView,
        .sections,
        .danger,
        .peekPop
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
        case .peekPop: return nil
        }
    }
}


// MARK: - Private Functions

fileprivate extension ViewController {
    
    func setupPeekAndPop() {
        guard let view = tableView else { return }
        actionSheetPreviewer = ActionSheetPreviewer(vc: self, sourceView: view)
    }
}


// MARK: - ActionSheetPreviewSource

extension ViewController: ActionSheetPreviewSource {
    
    func actionSheet(at location: CGPoint) -> ActionSheet? {
        guard
            let view = tableView,
            let path = view.indexPathForRow(at: location)
            else { return nil }
        return actionSheet(at: path)
    }
    
    func previewSourceView(for location: CGPoint) -> UIView? {
        guard
            let view = tableView,
            let path = view.indexPathForRow(at: location)
            else { return nil }
        return view.cellForRow(at: path)
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
        return "Examples"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = tableViewOptions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.tintColor = .darkGray
        cell.imageView?.image = option.image
        cell.textLabel?.text = option.displayName
        return cell
    }
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let option = tableViewOptions[indexPath.row]
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        guard let sheet = actionSheet(at: indexPath) else { return alert(option: option) }
        actionSheet = sheet
        actionSheet?.present(in: self, from: cell)
    }
}
