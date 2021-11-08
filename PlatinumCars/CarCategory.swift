//
//  CarCategory.swift
//  PlatinumCars
//
//  Created by Mantas Simanauskas on 2021-04-11.
//

import Foundation
import SwiftUI

struct CarCategory {
    var name: String
    var availableCars: Int
    var logo: Image
    
    init(name: String, availableCars: Int, logo: Image) {
        self.name = name
        self.availableCars = availableCars
        self.logo = logo
    }
}

let sampleData: [CarCategory] = [
    CarCategory(name: "Tesla", availableCars: 5, logo: Image("tesla")),
    CarCategory(name: "Ferrari", availableCars: 8, logo: Image("ferrari")),
    CarCategory(name: "Audi", availableCars: 10, logo: Image("audi")),
    CarCategory(name: "Dodge Ram", availableCars: 12, logo: Image("dodge"))
]
