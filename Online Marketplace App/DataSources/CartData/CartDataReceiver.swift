//
//  CartDataReceiver.swift
//  TestProject
//
//  Created by Bedirhan Maden on 17.12.2023.
//

import Foundation

struct CartDataReceiver: Decodable{
    var carts : [Cart]? = []
    var total : Int?     = nil
    var skip  : Int?     = nil
    var limit : Int?     = nil
}
