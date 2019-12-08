//
//  Menu+ActionSheet.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension Menu {
    
    /**
     Convert the menu to an action sheet.
     
     If your app uses custom action sheet subclasses, it can
     have a `toXActionSheet` function for each subclass, e.g.
     `toFoodActionSheet`. This way, you can adjust arguments
     and even completion signature.
     */
    func toActionSheet(
        configuration: ActionSheet.Configuration = .standard,
        headerConfiguration: ActionSheet.HeaderConfiguration = .standard,
        presenter: ActionSheetPresenter = ActionSheet.defaultPresenter,
        action: @escaping ActionSheet.SelectAction) -> ActionSheet {
        ActionSheet(
            menu: self,
            configuration: configuration,
            headerConfiguration: headerConfiguration,
            presenter: presenter,
            action: action
        )
    }
}
