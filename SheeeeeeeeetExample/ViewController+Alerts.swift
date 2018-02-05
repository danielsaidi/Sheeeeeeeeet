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
        alertSelection(item.title)
    }
    
    func alert(items: [ActionSheetItem]) {
        let message = items.map { $0.title }.joined(separator: " + ")
        alertSelection(message)
    }
    
    func alert(option: TableViewOption) {
        alert(title: nil, message: option.alertMessage)
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
