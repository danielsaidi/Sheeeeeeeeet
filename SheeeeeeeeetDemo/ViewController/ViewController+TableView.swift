//
//  ViewController+TableView.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-12-02.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This extension is used to provide the main view controller
 with table view delegate and data source functionality.
 
 */

import Sheeeeeeeeet
import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func menuOption(at indexPath: IndexPath) -> MenuOption {
        menuOptions[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = menuOption(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.tintColor = .darkGray
        cell.imageView?.image = option.image
        cell.textLabel?.text = option.title
        cell.detailTextLabel?.text = option.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        tryApplyingAppearance(at: indexPath)
        tryOpeningActionSheet(at: indexPath, from: cell)
    }
    
    func tryApplyingAppearance(at indexPath: IndexPath) {
        guard let appearance = self.appearance(at: indexPath) else { return }
        ActionSheet.applyAppearance(appearance)
        alert(title: "Appearance Change", message: "You have applied a new appearance")
    }
    
    func tryOpeningActionSheet(at indexPath: IndexPath, from cell: UITableViewCell) {
        let menu = self.foodMenu(at: indexPath)!
        //_ = menu.presentAsAlertController(in: self, from: cell) { (item) in print(item.title)}
        guard let sheet = actionSheet(at: indexPath) else { return }
        sheet.presenter.events.didDismissWithBackgroundTap = { print("Background tap!") }
        sheet.present(in: self, from: cell.textLabel)
    }
}
