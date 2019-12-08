//
//  MockNotificationCenter.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-02-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import Mockery

class MockNotificationCenter: NotificationCenter {
    
    var recorder = Mock()
    
    var addObserverInvokeCount = 0
    var addObserverInvokeObservers = [Any]()
    var addObserverInvokeNames = [NSNotification.Name?]()
    var addObserverInvokeObjects = [Any?]()
    override func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        addObserverInvokeCount += 1
        addObserverInvokeObservers.append(observer)
        addObserverInvokeNames.append(aName)
        addObserverInvokeObjects.append(anObject)
        addObserverTest(observer, selector: aSelector, name: aName, object: anObject)
    }
    
    func addObserverTest(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        recorder.invoke(addObserverTest, args: (observer, aSelector, aName, anObject))
    }
    
    override func removeObserver(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
        removeObserverTest(observer, name: aName, object: anObject)
    }
    
    func removeObserverTest(_ observer: Any, name aName: NSNotification.Name?, object anObject: Any?) {
        recorder.invoke(removeObserverTest, args: (observer, aName, anObject))
    }
}
