//
//  Evalpoint.swift
//  For42GS
//
//  Created by Kimdohyun on 10/16/24.
//

import Foundation

struct rank_Eval : Codable {
    
    let eval_photo : String
    let eval_intraId : String
    let eval_point : Int
    
    init(
    eval_photo : String = "",
    eval_intraId : String = "",
    eval_point : Int = 0
    ) {
        self.eval_photo = eval_photo
        self.eval_intraId = eval_intraId
        self.eval_point = eval_point
    }
}
