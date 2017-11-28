//
//  ActionSheetPreviewSource.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-28.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol ActionSheetPreviewSource: class {

    var actionSheet: ActionSheet? { get set }
    
    func actionSheet(at location: CGPoint) -> ActionSheet?
    func previewSourceView(for location: CGPoint) -> UIView?
}
