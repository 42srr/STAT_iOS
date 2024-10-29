//
//  Wallet.swift
//  For42GS
//
//  Created by Kimdohyun on 10/16/24.
//

import Foundation

struct rank_Wallet : Codable {
    
    let wallet_photo : String
    let wallet_intraId : String
    let wallet_dollar : Int
    
    init(
    wallet_photo : String = "",
    wallet_intraId : String = "",
    wallet_dollar : Int = 0
    ) {
        self.wallet_photo = wallet_photo
        self.wallet_intraId = wallet_intraId
        self.wallet_dollar = wallet_dollar
    }
}
