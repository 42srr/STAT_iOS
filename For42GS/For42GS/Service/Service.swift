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
    
    let appServer : String = "https://api.42srr.com"
    @Published var acToken : String? = KeychainItem.AcToken
    @Published var reToken : String? = KeychainItem.ReToken
    @Published var isLogin : Bool = UserDefaults.standard.bool(forKey: "isLogin")
    
    @Published var wallet : [rank_Wallet] = []
    @Published var eval : [rank_Eval] = []
    @Published var login_Url : URL = URL(string: "https://api.intra.42.fr/oauth/authorize?client_id=u-s4t2ud-598ae18e7a326adf87c4c13c715a91675c6b68458bb4082e24e297616ebd98d4&redirect_uri=http%3A%2F%2Flocalhost%3A5173&response_type=code")!
    
    func login(code: String) {
        let parameters: [String: String] = [
            "authCode" : code
        ]
        AF.request("\(appServer)/login", method: .get, parameters: parameters, encoding: URLEncoding.queryString)
            .responseDecodable(of: Auth.self) { response in
                switch response.result {
                case .success(let reData):
                    do {
                        try KeychainItem(service: "DonsNote.For42GS", account: "AcToken").saveItem(reData.acToken)
                        try KeychainItem(service: "DonsNote.For42GS", account: "ReToken").saveItem(reData.reToken)
                    } catch {
                        print("Token Response on Keychain is fail")
                    }
                    self.acToken = reData.acToken
                    self.reToken = reData.reToken
                    self.isLogin = true
                    UserDefaults.standard.set(true, forKey: "isLogin")
                    print("Login Success")
                case .failure(let error):
                    self.isLogin = false
                    UserDefaults.standard.set(false, forKey: "isLogin")
                    print("Login Error : \(error)")
                }
            }
    }
    
    func refresh_Token() {
        let parameters: [String: String] = [
            "refreshToken" : reToken!
        ]
        AF.request("\(appServer)/refresh", method: .post, parameters: parameters)
            .responseDecodable(of: Auth.self) { response in
                switch response.result {
                case .success(let reData):
                    do {
                        try KeychainItem(service: "DonsNote.For42GS", account: "AcToken").saveItem(reData.acToken)
                        try KeychainItem(service: "DonsNote.For42GS", account: "ReToken").saveItem(reData.reToken)
                    } catch {
                        print("Token Response on Keychain is fail")
                    }
                    self.acToken = reData.acToken
                    self.reToken = reData.reToken
                    print("Refresh Success")
                case .failure(let error):
                    print("Refresh Error : \(error)")
                }
            }
    }
    
    func rank_wallet() {
        let headers: HTTPHeaders = [.authorization(bearerToken: acToken ?? "")]
        AF.request("\(appServer)/ranking/wallet", method: .get)
            .responseDecodable(of: [rank_Wallet].self) { response in
                switch response.result {
                case .success(let reData):
                    self.wallet = reData
                    print("Get Success : Wallet_Rank")
                case .failure(let error):
                    print("Get Error : \(error)")
                }
            }
    }
    
    func rank_eval() {
        let headers: HTTPHeaders = [.authorization(bearerToken: acToken ?? "")]
        AF.request("\(appServer)/ranking/evalpoint", method: .get)
            .responseDecodable(of: [rank_Eval].self) { response in
                switch response.result {
                case .success(let reData):
                    self.eval = reData
                    print("Get Success : Eval_Rank")
                case .failure(let error):
                    print("Get Error : \(error)")
                }
            }
    }
}
