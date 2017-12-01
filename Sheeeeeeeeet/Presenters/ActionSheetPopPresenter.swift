//
//  ActionSheetPopPresenter.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-12-01.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ActionSheetPopPresenter: ActionSheetPresenterBase {

    
    // MARK: - Protected Functions
    
    public override func addBackgroundView(to view: UIView) {
        super.addBackgroundView(to: view)
        guard let view = backgroundView else { return }
        let mask = view.autoresizingMask
        let blurContainer = UIView(frame: view.frame)
        view.addSubview(blurContainer)
        blurContainer.frame = view.bounds
        blurContainer.autoresizingMask = mask
        let blurView = self.blurView(withStyle: .light)
        blurContainer.addSubview(blurView)
        blurView.frame = view.bounds
        blurView.autoresizingMask = mask
    }
}


fileprivate extension ActionSheetPopPresenter {
    
    func blurView(withStyle style: UIBlurEffectStyle) -> UIView {
        let blur = UIBlurEffect(style: style)
        return UIVisualEffectView(effect: blur)
    }
}
