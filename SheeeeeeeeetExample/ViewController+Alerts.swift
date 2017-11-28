//
//  ViewController+Alerts.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

extension ViewController {
    
    func alert(item: ActionSheetItem) {
        alert(message: item.title)
    }
    
    func alert(items: [ActionSheetItem]) {
        let message = items.map { $0.title }.joined(separator: " + ")
        alert(message: message)
    }
    
    func alert(option: TableViewOption) {
        alert(message: option.alertMessage)
    }
    
    func alert(message: String) {
        let title = "You selected:"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
