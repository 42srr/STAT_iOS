//
//  For42GSApp.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import SwiftUI

@main
struct For42GSApp: App {
    
    //MARK: - 1. PROPERTY
    
    @StateObject var service = Service()
    
    //MARK: -2. BODY
    
    var body: some Scene {
        WindowGroup {
            if service.isLogin {
                ContentView().environmentObject(service)
            } else {
                LoginPageView().environmentObject(service)
            }
        }
    }
}
