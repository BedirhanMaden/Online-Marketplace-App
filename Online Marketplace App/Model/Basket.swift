//
//  Basket.swift
//  TestProject
//
//  Created by Bedirhan Maden on 3.01.2024.
//

import Foundation

struct Basket: Codable{
    var uid: String
    var products: [Product] = []
}
