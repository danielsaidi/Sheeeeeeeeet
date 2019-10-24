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
    
    
    // MARK: - Properties
    
    var delegate: AnyObject?
    
    private var triggerLabel: UIView? {
        view.subviews.first { $0 is CustomTriggerLabel }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var addTriggerButton: UIButton! {
        didSet { addTriggerButton?.isHidden = false }
    }
    
    @IBOutlet weak var removeTriggerButton: UIButton! {
        didSet { removeTriggerButton?.isHidden = true }
    }
    
    @IBOutlet weak var stackView: UIStackView! {
        didSet {
            if #available(iOS 13, *) { stackView.isHidden = false }
            else { stackView.isHidden = true }
        }
    }
    
    @IBOutlet weak var textLabel: UILabel! {
        didSet { addContextMenuInstructions(to: textLabel) }
    }
    
    @IBOutlet weak var textLabelContainer: UIView! {
        didSet {
            textLabelContainer.layer.cornerRadius = 10
            addContextMenu(to: textLabelContainer)
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func addTriggerView(_ sender: Any) {
        removeTriggerView(sender)
        let label = createTriggerLabel()
        addRetainedContextMenu(to: label)
        updateTriggerButtons(isAddVisible: false)
    }
    
    @IBAction func removeTriggerView(_ sender: Any) {
        triggerLabel?.removeFromSuperview()
        updateTriggerButtons(isAddVisible: true)
    }
}


// MARK: - Private Functions

private extension ContextMenuViewController {
    
    func addContextMenu(to view: UIView) {
        guard #available(iOS 13.0, *) else { return }
        let menu = ItemMenu(food: foodOptions)
        delegate = menu.addAsContextMenu(to: view, previewProvider: { Preview() }) { item in
            print(item.title)
        }
    }
    
    func addRetainedContextMenu(to view: UIView & ContextMenuDelegateRetainer) {
        guard #available(iOS 13.0, *) else { return }
        let menu = ItemMenu(food: foodOptions)
        menu.addAsRetainedContextMenu(to: view, previewProvider: { Preview() }) { item in
            print(item.title)
        }
    }
    
    func addContextMenuInstructions(to label: UILabel) {
        if #available(iOS 13.0, *) {
            label.text = "Press me to show a context menu"
            label.isUserInteractionEnabled = true
        } else {
            label.text = "Native context menus require iOS 13"
        }
    }
    
    func createTriggerLabel() -> CustomTriggerLabel {
        var frame = stackView.frame
        frame.origin.y += 100
        let label = CustomTriggerLabel(frame: frame)
        label.textAlignment = .center
        view.addSubview(label)
        label.text = "Press me"
        return label
    }
    
    func updateTriggerButtons(isAddVisible: Bool) {
        addTriggerButton.isHidden = !isAddVisible
        removeTriggerButton.isHidden = isAddVisible
    }
}


// MARK: - Custom Trigger View, used to test deallocation

private class CustomTriggerLabel: UILabel, ContextMenuDelegateRetainer {
    
    deinit {
        #if DEBUG
        print("Deinitialized CustomTriggerLabel")
        #endif
    }
    
    var contextMenuDelegate: Any?
}


// MARK: - Custom Preview View, used as context menu preview

private class Preview: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        preferredContentSize = CGSize(width: 100, height: 100)
    }
}
