//
//  ActionSheetLinkItemTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2017-11-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Sheeeeeeeeet
import UIKit

class ActionSheetLinkItemCellTests: QuickSpec {
    
    override func spec() {
        
        describe("refreshing") {
            
            it("applies accessory view with link icon") {
                let cell = ActionSheetLinkItemCell(style: .default)
                cell.linkIcon = UIImage()
                cell.refresh()
                let imageView = cell.accessoryView as? UIImageView
                expect(imageView?.image).toNot(beNil())
                expect(imageView?.image).to(be(cell.linkIcon))
            }
        }
    }
}
