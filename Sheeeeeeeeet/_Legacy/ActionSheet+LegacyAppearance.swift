//
//  ActionSheet+LegacyAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension ActionSheet {

    @available(*, deprecated, message: "applyLegacyAppearance will be removed in 1.4.0. Use the new appearance model instead.")
    func applyLegacyAppearance() {
        applyLegacyContentInsets()
        applyLegacyCornerRadius()
    }
}

private extension ActionSheet {
    
    func applyLegacyContentInsets() {
        guard let inset = appearance.contentInset else { return }
        minimumContentInsets.top = inset
        minimumContentInsets.left = inset
        minimumContentInsets.right = inset
        minimumContentInsets.bottom = inset
    }
    
    func applyLegacyCornerRadius() {
        guard let radius = appearance.cornerRadius else { return }
        headerViewContainer?.cornerRadius = radius
        itemsTableView?.cornerRadius = radius
        buttonsTableView?.cornerRadius = radius
    }
}
