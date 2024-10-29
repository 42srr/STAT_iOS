//
//  FtUser.swift
//  For42GS
//
//  Created by Kimdohyun on 10/16/24.
//

import Foundation

struct FtUser : Codable {
    
    let id : Int
    let fdId : Int
    let intraId : String
    let role : String
    let email : String
    let url : String
    let wallet : Int
    let collectionPoint : Int
    let level : Double
    let image : String
    
    init(
        id : Int = 0,
        fdId : Int = 0,
        intraId : String = "",
        role : String = "",
        email : String = "",
        url : String = "",
        wallet : Int = 0,
        collectionPoint : Int = 0,
        level : Double = 0,
        image : String = ""
    ) {
        self.id = id
        self.fdId = fdId
        self.intraId = intraId
        self.role = role
        self.email = email
        self.url = url
        self.wallet = wallet
        self.collectionPoint = collectionPoint
        self.level = level
        self.image = image
    }
}
