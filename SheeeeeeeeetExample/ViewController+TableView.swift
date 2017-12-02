//
//  ViewController+TableView.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-12-02.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

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

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let option = tableViewOptions[indexPath.row]
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        guard let sheet = actionSheet(at: indexPath) else {
            return handleNonSheetOption(option)
        }
        actionSheet = sheet
        actionSheet?.present(in: self, from: cell)
    }
}
