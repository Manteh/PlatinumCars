//
//  Car.swift
//  PlatinumCars
//
//  Created by Mantas Simanauskas on 2021-05-03.
//

import Foundation
import SwiftUI

var c = [
    Car.init(headline: "Mercedes-Benz A 200 163hk / Night pack / LEASEBAR / Sv.såld", image: Image("merc"), brand: "Mercedes-Benz", model: "A 200", hp: 163, year: 2019, mileage: 6100, color: "COSMOS BLACK METALLIC", desc: "Nu i lager en grym LEASEBAR och Svensksåld Mercedes-Benz A200 163hk färgen Cosmos Black metallic med svart konstläder/antracit-interiör och endast 6100mil!, Finans kan ordnas och vi tar gärna din bil i inbyte. Platinumcars the Collection ett av Sveriges största sportbilscenter direkt längs med E4:an i Norrköping. Komplett Rekond, Verkstad, Tuning, Toning, Foliering. Välkommen att boka in er fina bil!", price: "249.000 SEK", monthly: "1,882 SEK / MÅNAD"),
    Car.init(headline: "Audi A3 Cab 1.8 TFSI Q S Tronic 180hk / B&O / Sv.såld", image: Image("header"), brand: "Audi", model: "A3 Cab", hp: 180, year: 2015, mileage: 5400, color: "AMALFI WHITE", desc: "Nu i lager en jättefin Svensksåld Audi A3 Cab 1.8 TFSI 180hk Quattro i färgen Amalfi White med svart pärlnappa-läder/alcantara-interiör och endast 5400mil!, Finans kan ordnas och vi tar gärna din bil i inbyte. Platinumcars the Collection ett av Sveriges största sportbilscenter direkt längs med E4:an i Norrköping. Komplett Rekond, Verkstad, Tuning, Toning, Foliering. Välkommen att boka in er fina bil!", price: "249.000 SEK", monthly: "1,882 SEK / MÅNAD")
]

struct Car: Identifiable {
    let id = UUID()
    var headline: String
    var image: Image
    var brand: String
    var model: String
    var hp: Int
    var year: Int
    var mileage: Int
    var color: String
    var desc: String
    var price: String
    var monthly: String
}

extension Car {
    func header() -> String{
        return "\(self.year) / \(self.mileage) MIL / \(self.color)"
    }
}
