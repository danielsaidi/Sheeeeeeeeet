import UIKit

open class ActionSheetCollectionViewItemAppearance: ActionSheetItemAppearance {
    
    // MARK: - Initialization
    
    public override init(copy: ActionSheetItemAppearance) {
        super.init()
        self.height = copy.height
    }
    
    // MARK: - Properties
    
}
