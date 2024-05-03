//
//  Service.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import Foundation
import SwiftUI
import Alamofire

class Service : ObservableObject {
    
    @Published var isLogin : Bool = false
    @Published var auth : Auth = Auth()
    @Published var quotes : Quotes = Quotes()
    
    func getQuotes() {
        AF.request("https://c052-118-67-134-143.ngrok-free.app/quotes", method: .get)
            .responseDecodable(of: Quotes.self) { response in
                switch response.result {
                case .success(let data):
                    self.quotes = data
                    print("Get Today Quotes Success")
                case .failure(let error):
                    print("Error : \(error)")
                }
            }
    }
    
    
}
