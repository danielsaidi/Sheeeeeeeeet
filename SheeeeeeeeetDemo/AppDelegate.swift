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
        printInstructions()
        //UIView.appearance().semanticContentAttribute = .forceRightToLeft
    }
}

private extension AppDelegate {
    
    func printInstructions() {
        print("")
        print("**** INSTRUCTIONS ****")
        print("You can apply a custom theme under 'Appearances'. It has")
        print("a bunch of strange styles that demonstrates the power of")
        print("the appearance engine.")
        print("")
        print("To enable right-to-left, either setup your device to use")
        print("a right-to-left locale or enabled the commented out line")
        print("in AppDelegate.")
        print("**** INSTRUCTIONS ****")
        print("")
    }
}
