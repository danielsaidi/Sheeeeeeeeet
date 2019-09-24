//
//  AppDelegate.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-08-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        ActionSheet.applyAppearance(.demo)
    }
}
