//
//  ShareViewController.swift
//  SheeeeeeeeeetExtensionDemo
//
//  Created by James Bellamy on 23/12/2019.
//

import Sheeeeeeeeet
import UIKit

class ShareViewController: UIViewController {
    @IBAction func showAction(_ sender: Any) {
        let menu = Menu(items: [OkButton(title: "OK")])
        let sheet = ActionSheet(menu: menu) { _, item in
            print("Selected")
        }
        sheet.present(in: self, from: self.view)
    }
}
