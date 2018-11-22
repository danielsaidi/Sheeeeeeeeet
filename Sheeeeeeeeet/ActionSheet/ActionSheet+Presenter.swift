//
//  ActionSheet+Presenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2018-04-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

public extension ActionSheet {
    
    static var defaultPresenter: ActionSheetPresenter {
        return UIDevice.current.userInterfaceIdiom.defaultPresenter
    }
}


// MARK: - Internal Extensions

extension UIUserInterfaceIdiom {
    
    var defaultPresenter: ActionSheetPresenter {
        switch self {
        case .pad:
            if UIApplication.shared.isFullScreen ?? true {
                return ActionSheetPopoverPresenter()
            }
            fallthrough
        default: return ActionSheetStandardPresenter()
        }
    }
    
}

extension UIApplication {
    
    public var isFullScreen: Bool? {
        guard let w = self.delegate?.window, let window = w else { return nil }
        return window.frame.width == window.screen.bounds.width
    }
    
}
