//
//  ContextMenuViewController.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-09-25.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

class ContextMenuViewController: ViewController {
    
    var delegate: AnyObject?
    
    @IBOutlet weak var textLabel: UILabel! {
        didSet { addContextMenuInstructions(to: textLabel) }
    }
    
    @IBOutlet weak var textLabelContainer: UIView! {
        didSet { addContextMenuInteraction(to: textLabelContainer) }
    }
    
    func addContextMenuInteraction(to view: UIView) {
        view.layer.cornerRadius = 10
        guard #available(iOS 13.0, *) else { return }
        let menu = ItemMenu(food: foodOptions)
        delegate = menu.addAsContextMenu(to: view, previewProvider: { Preview() }) { item in
            print(item.title)
        }
    }
    
    func addContextMenuInstructions(to label: UILabel) {
        if #available(iOS 13.0, *) {
            label.text = "Press me to show a context menu"
            label.isUserInteractionEnabled = true
        } else {
            label.text = "Context menus only work in iOS 13 :("
        }
    }
}


private class Preview: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        preferredContentSize = CGSize(width: 100, height: 100)
    }
}
