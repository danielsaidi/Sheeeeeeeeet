//
//  SceneDelegate.swift
//  SheeeeeeeeetDemo
//
//  Created by Daniel Saidi on 2019-08-19.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Sheeeeeeeeet
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        ActionSheet.applyAppearance(.demo)
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}
