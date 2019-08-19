//
//  AppDelegate.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-08-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit
import Sheeeeeeeeet

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        ActionSheet.applyAppearance(.demo)
    }
}
