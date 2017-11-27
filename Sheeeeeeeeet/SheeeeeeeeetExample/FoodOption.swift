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
    fast,
    fineDining,
    homeMade,
    nothing
    
    var displayName: String {
        switch self {
        case .fast: return "Something fast"
        case .fineDining: return "Something fancy"
        case .homeMade: return "Something home-made"
        case .nothing: return "I don't eat"
        }
    }
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    var imageName: String {
        switch self {
        case .fast: return "ic_pizza"
        case .fineDining: return "ic_cutlery"
        case .homeMade: return "ic_grocery"
        case .nothing: return "ic_drink"
        }
    }
}
