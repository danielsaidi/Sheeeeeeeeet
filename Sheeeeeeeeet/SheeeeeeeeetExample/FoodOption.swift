//
//  FoodOption.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

enum FoodOption: String {
    
    case
    fancy,
    fast,
    homeMade,
    none
    
    var displayName: String {
        switch self {
        case .fancy: return "Something fancy"
        case .fast: return "Something fast"
        case .homeMade: return "Something home-made"
        case .none: return "I don't eat"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    var imageName: String {
        switch self {
        case .fancy: return "ic_cutlery"
        case .fast: return "ic_pizza"
        case .homeMade: return "ic_grocery"
        case .none: return "ic_drink"
        }
    }
}
