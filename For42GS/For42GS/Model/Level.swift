//
//  Level.swift
//  For42GS
//
//  Created by Kimdohyun on 10/9/24.
//

import Foundation

struct Level : Codable {
    
    let level: [String: Int]
    
    init(
        level: [String: Int] = ["": 0]
    ) {
        self.level = level
    }
}
