//
//  MockViewController.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2019-01-15.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 `TODO` Convert to real mock.
 */
class MockViewController: UIViewController {
    
    var dismissInvokeCount = 0
    var dismissInvokeAnimateds = [Bool]()
    var dismissInvokeCompletions = [(() -> Void)?]()
    var presentInvokeCount = 0
    var presentInvokeVcs = [UIViewController]()
    var presentInvokeAnimateds = [Bool]()
    var presentInvokeCompletions = [(() -> Void)?]()

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissInvokeCount += 1
        dismissInvokeAnimateds.append(flag)
        dismissInvokeCompletions.append(completion)
    }
    
    func completeDismissal() {
        dismissInvokeCompletions.last??()
    }
    
    override func present(_ vc: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentInvokeCount += 1
        presentInvokeVcs.append(vc)
        presentInvokeAnimateds.append(flag)
        presentInvokeCompletions.append(completion)
    }
}
