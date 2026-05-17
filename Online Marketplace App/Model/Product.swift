//
//  Product.swift
//  TestProject
//
//  Created by Bedirhan Maden on 14.12.2023.
//

import Foundation

struct Product: Codable, Hashable {

    
    var id                 : Int?      = nil
    var title              : String?   = nil
    var description        : String?   = nil
    var price              : Int?      = nil
    var discountPercentage : Double?   = nil
    var rating             : Double?   = nil
    var stock              : Int?      = nil
    var brand              : String?   = nil
    var category           : String?   = nil
    var thumbnail          : String?   = nil
    var images             : [String]? = []

}


