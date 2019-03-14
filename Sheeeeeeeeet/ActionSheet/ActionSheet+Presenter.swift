//
//  ActionSheet+Presenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-04-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

public extension ActionSheet {
    
    static var defaultPresenter: ActionSheetPresenter {
        let traits = UIApplication.shared.keyWindow?.traitCollection
        return defaultPresenter(forTraits: traits)
    }
}

extension ActionSheet {
    
    static func defaultPresenter(forTraits traits: UITraitCollection?) -> ActionSheetPresenter {
        let idiom = UIDevice.current.userInterfaceIdiom
        return defaultPresenter(forIdiom: idiom, traits: traits)
    }
    
    static func defaultPresenter(forIdiom idiom: UIUserInterfaceIdiom, traits: UITraitCollection?) -> ActionSheetPresenter {
        if idiom == .phone { return ActionSheetStandardPresenter() }
        let sizeClass = traits?.horizontalSizeClass ?? .compact
        let isCompact = sizeClass == .compact
        return isCompact ? ActionSheetStandardPresenter() : ActionSheetPopoverPresenter()
    }
}
