//
//  Auth.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import Foundation

struct data : Codable {
    
    var intraId : String
    var accessToken : String
    var refreshToken : String
    
    init(
        
        intraId : String = "",
        accessToken : String = "",
        refreshToken : String = ""
    ) {
        self.intraId = intraId
        self.accessToken = KeychainItem.AcToken
        self.refreshToken = KeychainItem.ReToken
    }
}

struct AuthData : Codable {
    
    var status : String
    var code : Int
    var message : String
    var data : data
    
    init(
        
        status : String = "",
        code : Int = 0,
        message : String = "",
        data : data
    ) {
        self.status = status
        self.code = code
        self.message = message
        self.data = data
    }
}
