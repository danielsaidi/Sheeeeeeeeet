//
//  MockTableView.swift
//  SheeeeeeeeetTests
//
//  Created by Daniel Saidi on 2018-10-17.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

class MockTableView: UITableView {

    var reloadDataInvokeCount = 0
    
    override func reloadData() {
        super.reloadData()
        reloadDataInvokeCount += 1
    }
}
