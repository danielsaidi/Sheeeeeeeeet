//
//  ViewController+Alerts.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This extension provides the main view controller with alert
 shorthands.
 
 */

import UIKit
import Sheeeeeeeeet

extension ViewController {
    
    func alert(button: UIButton) {
        alertSelection(button.title(for: .normal) ?? "None")
    }
    
    func alert(item: MenuItem) {
        alert(items: [item])
    }
    
    func alert(items: [MenuItem]) {
        let items = items.filter { !($0 is MenuButton) }
        guard items.count > 0 else { return }
        alertSelection(items.map { $0.title }.joined(separator: " + "))
    }
    
    func alert(items: [DemoCollectionViewCell.Item]) {
        guard items.count > 0 else { return }
        alertSelection(items.map { $0.title }.joined(separator: " + "))
    }
    
    func alert(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func alertSelection(_ value: String) {
        alert(title: "You selected:", message: value)
    }
}
