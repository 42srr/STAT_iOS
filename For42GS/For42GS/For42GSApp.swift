//
//  For42GSApp.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import SwiftUI

@main
struct For42GSApp: App {
    
    @StateObject var service = Service()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(service)
        }
    }
}
