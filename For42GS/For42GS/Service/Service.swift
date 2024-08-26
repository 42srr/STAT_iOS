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
    
    let appServer : String = "https://9jwkpwdev2.apigw.ntruss.com/api/dev"
    @Published var callBackUrl : URL = URL(string: "https://example.com")!
    @Published var isLogin : Bool = false
    @Published var auth : Auth = Auth()
    @Published var quotes : Quotes = Quotes()
    
    func getQuotes() {
        AF.request("\(appServer)/quotes", method: .get)
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
