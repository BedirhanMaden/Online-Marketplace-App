//
//  Cart.swift
//  TestProject
//
//  Created by Bedirhan Maden on 14.12.2023.
//

import Foundation

struct Cart: Decodable, Hashable {

    var id              : Int?        = nil
    var products        : [Products] = []
    var total           : Int?        = nil
    var discountedTotal : Int?        = nil
    var userId          : Int?        = nil
    var totalProducts   : Int?        = nil
    var totalQuantity   : Int?        = nil
}

struct Products: Decodable, Hashable {

    var id                 : Int?    = nil
    var title              : String? = nil
    var price              : Int?    = nil
    var quantity           : Int?    = nil
    var total              : Int?    = nil
    var discountPercentage : Double? = nil
    var discountedPrice    : Int?    = nil
    var thumbnail          : String? = nil
}
