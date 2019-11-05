//
//  ActionSheetSecondaryActionItemCell.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-11-01.
//

import UIKit

open class ActionSheetSecondaryActionItemCell: ActionSheetItemCell {
    
    
    // MARK: - Properties
    
    var tapAction: SecondaryAction?
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var secondaryActionIcon: UIImage?
    @objc public dynamic var secondaryActionIconColor: UIColor?
    
    
    // MARK: - Types
    
    typealias SecondaryAction = (ActionSheetSecondaryActionItemCell) -> Void
    
    
    // MARK: - Functions
    
    open override func refresh() {
        super.refresh()
        guard let item = item as? SecondaryActionItem else { return }
        applyAccessoryView(for: item)
        applyAccessoryViewColor(for: item)
        applySecondaryAction(for: item)
    }
}


private extension ActionSheetSecondaryActionItemCell {
    
    func applyAccessoryView(for item: SecondaryActionItem) {
        guard let image = secondaryActionIcon else { return }
        accessoryView = UIImageView(image: image)
    }
    
    func applyAccessoryViewColor(for item: SecondaryActionItem) {
        guard let color = secondaryActionIconColor else { return }
        accessoryView?.tintColor = color
    }
    
    func applySecondaryAction(for item: SecondaryActionItem) {
        let tapGestures = accessoryView?.gestureRecognizers?.filter { $0 is UITapGestureRecognizer }
        let count = tapGestures?.count ?? 0
        guard count == 0 else { return }
        accessoryView?.accessibilityTraits = [.button]
        accessoryView?.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(triggerTapAction))
        accessoryView?.addGestureRecognizer(gesture)
    }
    
    @objc func triggerTapAction() {
        tapAction?(self)
    }
}
