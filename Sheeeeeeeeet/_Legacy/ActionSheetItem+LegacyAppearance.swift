//
//  ActionSheetItem+LegacyAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-01-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension ActionSheetItem {
    
    @available(*, deprecated, message: "applyLegacyAppearance will be removed in 1.4.0. Use the new appearance model instead.")
    func applyLegacyAppearance(to cell: UITableViewCell) {
        guard let itemCell = cell as? ActionSheetItemCell else { return }
        applyLegacyFont(to: itemCell)
    }
}

private extension ActionSheetItem {
    
    func applyLegacyFont(to cell: ActionSheetItemCell) {
        guard let font = appearance.font else { return }
        cell.titleFont = font
    }
}
