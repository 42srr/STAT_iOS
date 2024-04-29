//
//  ProgressModel.swift
//  For42GS
//
//  Created by devoogie on 4/25/24.
//

import Foundation

class ProgressModel: ObservableObject {
    @Published var name: String
    @Published var progress: Float
    
    init(
        name : String = "",
        progress : Float = 0
    ) {
        self.name = name
        self.progress = progress
    }
}
