//
//  Quotes.swift
//  For42GS
//
//  Created by Kimdohyun on 4/25/24.
//

import Foundation

struct Quotes : Codable {
    
    var name : String
    var content : String
    
    init(
        name : String = "",
        content : String = ""
    ) {
        self.name = name
        self.content = content
    }
}
