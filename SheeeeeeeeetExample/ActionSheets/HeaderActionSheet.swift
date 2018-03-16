//
//  HeaderActionSheet.swift
//  SheeeeeeeeetExample
//
//  Created by Jonas Ullström on 2018-03-16.
//  Copyright © 2018 Jonas Ullström. All rights reserved.
//

import Sheeeeeeeeet

class HeaderActionSheet: ActionSheet {
    
    init(options: [FoodOption], action: @escaping ([ActionSheetItem]) -> ()) {
        let items = HeaderActionSheet.items(for: options)
        super.init(items: items) { _, item in
            if item.value == nil { return }
            action([item])
        }
        let image = UIImage(named: "title-image")
        headerView = UIImageView(image: image)
        headerView?.frame.size.height = 150
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

fileprivate extension HeaderActionSheet {
    
    static func items(for options: [FoodOption]) -> [ActionSheetItem] {
        var items = options.map { $0.item() }
        items.insert(createTitleItem(title: standardTitle), at: 0)
        items.append(createCancelButton())
        return items
    }
}
