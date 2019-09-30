//
//  ContextMenuDelegateTests.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-25.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import Sheeeeeeeeet

class ContextMenuDelegateTests: QuickSpec {
    
    override func spec() {
        
        describe("creating context menu interaction") {
            
            it("returns menu configuration") {
                guard #available(iOS 13.0, *) else { return }
                let items = [MenuItem(title: "item"), OkButton(title: "ok")]
                let menu = Menu(title: "title", items: items)
                let delegate = ContextMenuDelegate(menu: menu, action: { _ in })
                let interaction = UIContextMenuInteraction(delegate: MockDelegate())
                let result = delegate.contextMenuInteraction(interaction, configurationForMenuAtLocation: .zero)
                expect(result).toNot(beNil())
            }
        }
    }
}

@available(iOS 13.0, *)
class MockDelegate: NSObject, UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        fatalError()
    }
}
