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
    @Published var Auth : AuthData = AuthData(data: data())
    @Published var isLogin : Bool = UserDefaults.standard.bool(forKey: "isLogin")
    @Published var wallet : [rank_Wallet] = []
    @Published var eval : [rank_Eval] = []
    @Published var login_Url : URL = URL(string: "https://api.intra.42.fr/oauth/authorize?client_id=u-s4t2ud-598ae18e7a326adf87c4c13c715a91675c6b68458bb4082e24e297616ebd98d4&redirect_uri=https%3A%2F%2Fstat.42srr.com&response_type=code")!
    
    func login(code: String) {
        let parameters: [String: String] = [
            "code" : code
        ]
        AF.request("\(appServer)/login", method: .get, parameters: parameters, encoding: URLEncoding.queryString)
            .responseDecodable(of: AuthData.self) { response in
                switch response.result {
                case .success(let reData):
                    do {
                        try KeychainItem(service: "DonsNote.For42GS", account: "AcToken").saveItem(reData.data.accessToken)
                        try KeychainItem(service: "DonsNote.For42GS", account: "ReToken").saveItem(reData.data.refreshToken)
                    } catch {
                        print("Token Response on Keychain is fail")
                    }
                    self.Auth.status = reData.status
                    self.Auth.code = reData.code
                    self.Auth.message = reData.message
                    self.Auth.data.intraId = reData.data.intraId
                    self.Auth.data.accessToken = reData.data.accessToken
                    self.Auth.data.refreshToken = reData.data.refreshToken
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
            "refreshToken" : Auth.data.refreshToken
        ]
        AF.request("\(appServer)/refresh", method: .post, parameters: parameters)
            .responseDecodable(of: AuthData.self) { response in
                switch response.result {
                case .success(let reData):
                    do {
                        try KeychainItem(service: "DonsNote.For42GS", account: "AcToken").saveItem(reData.data.accessToken)
                        try KeychainItem(service: "DonsNote.For42GS", account: "ReToken").saveItem(reData.data.refreshToken)
                    } catch {
                        print("Token Response on Keychain is fail")
                    }
                    self.Auth.data.accessToken = reData.data.accessToken
                    self.Auth.data.refreshToken = reData.data.refreshToken
                    print("Refresh Success")
                case .failure(let error):
                    print("Refresh Error : \(error)")
                }
            }
    }
    
    func rank_wallet() {
        let _: HTTPHeaders = [.authorization(bearerToken: Auth.data.accessToken)]
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
        let _: HTTPHeaders = [.authorization(bearerToken: Auth.data.accessToken)]
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
