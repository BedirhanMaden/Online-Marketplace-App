//
//  UserDataReceiver.swift
//  TestProject
//
//  Created by Bedirhan Maden on 17.12.2023.
//

import Foundation

struct UserDataReceiver: Decodable{
    var users : [User]? = []
    var total : Int?     = nil
    var skip  : Int?     = nil
    var limit : Int?     = nil
}
