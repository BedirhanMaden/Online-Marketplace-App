//
//  ProductListDataReceiver.swift
//  TestProject
//
//  Created by Bedirhan Maden on 16.12.2023.
//

import Foundation

struct ProductListDataReceiver: Decodable{
    
      var products : [Product] = []
      var total    : Int?        = nil
      var skip     : Int?        = nil
      var limit    : Int?        = nil
}
