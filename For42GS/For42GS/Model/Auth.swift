//
//  Auth.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import Foundation

struct Auth : Codable {
    
    var intraId : String
    var intraPass : String
    
    init(
        intraId : String = "",
        intraPass : String = ""
    ) {
        self.intraId = intraId
        self.intraPass = intraPass
    }
}
