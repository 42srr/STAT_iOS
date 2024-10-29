//
//  Auth.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import Foundation

struct Auth : Codable {
    
    var acToken : String
    var reToken : String
    
    init(
        acToken : String = "",
        reToken : String = ""
    ) {
        self.acToken = acToken
        self.reToken = reToken
    }
}
