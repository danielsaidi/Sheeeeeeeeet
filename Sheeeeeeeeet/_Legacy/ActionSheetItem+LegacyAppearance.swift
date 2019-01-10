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
        applyLegacyBackgroundColor(to: cell)
        applyLegacyFont(to: cell)
        applyLegacySubtitleFont(to: cell)
    }
}

private extension ActionSheetItem {
    
    func applyLegacyBackgroundColor(to cell: UITableViewCell) {
        guard let color = appearance.backgroundColor else { return }
        let cell = cell as? ActionSheetItemCell
        cell?.backgroundColor = color
    }
    
    func applyLegacyFont(to cell: UITableViewCell) {
        guard let font = appearance.font else { return }
        let cell = cell as? ActionSheetItemCell
        cell?.titleFont = font
    }
    
    func applyLegacySubtitleFont(to cell: UITableViewCell) {
        guard let font = appearance.subtitleFont else { return }
        let cell = cell as? ActionSheetItemCell
        cell?.subtitleFont = font
    }
}
