//
//  MockNotificationCenter.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-02-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

class MockNotificationCenter: NotificationCenter {
    
    var addObserverInvokeCount = 0
    var addObserverInvokeObservers = [Any]()
    var addObserverInvokeNames = [NSNotification.Name?]()
    var addObserverInvokeObjects = [Any?]()
    override func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        addObserverInvokeCount += 1
        addObserverInvokeObservers.append(observer)
        addObserverInvokeNames.append(aName)
        addObserverInvokeObjects.append(anObject)
    }
    
    var removeObserverInvokeCount = 0
    var removeObserverInvokeObservers = [Any]()
    var removeObserverInvokeNames = [NSNotification.Name?]()
    var removeObserverInvokeObjects = [Any?]()
    override func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
        removeObserverInvokeCount += 1
        removeObserverInvokeObservers.append(observer)
        removeObserverInvokeNames.append(aName)
        removeObserverInvokeObjects.append(anObject)
    }
}
