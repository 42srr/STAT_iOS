//
//  Projects.swift
//  For42GS
//
//  Created by Kimdohyun on 10/14/24.
//

import Foundation

struct Projects : Codable {
    
    let projects: [String: Int]
    
    init(
        projects: [String: Int] = ["": 0]
    ) {
        self.projects = projects
    }
}
