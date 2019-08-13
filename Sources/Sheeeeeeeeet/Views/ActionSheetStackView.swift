//
//  ActionSheetStackView.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-13.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This is the main stack view that is used by an action sheet
 to stack a header view, items table and buttons table.
 */
open class ActionSheetStackView: UIStackView {

    open func setup(in sheet: ActionSheet) {
        guard let view = sheet.view else { return }
        axis = .vertical
        alignment = .fill
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        sheet.topMargin = topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 0)
        sheet.leftMargin = leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        sheet.rightMargin = view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        sheet.bottomMargin = view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([
            sheet.topMargin,
            sheet.leftMargin,
            sheet.rightMargin,
            sheet.bottomMargin
        ])
    }
}
