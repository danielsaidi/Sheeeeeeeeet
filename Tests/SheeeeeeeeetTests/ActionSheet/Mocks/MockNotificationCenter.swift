//
//  MockNotificationCenter.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-02-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import Mockery

class MockNotificationCenter: NotificationCenter, Mockable {
    
    lazy var addObserverRef = MockReference(addObserver as (Any, Selector, NSNotification.Name?, Any?) -> Void)
    lazy var removeObserverRef = MockReference(removeObserver as (Any, NSNotification.Name?, Any?) -> Void)
    
    var mock = Mock()
    
    override func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        invoke(addObserverRef, args: (observer, aSelector, aName, anObject))
    }
    
    override func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
        invoke(removeObserverRef, args: (observer, aName, anObject))
    }
}
