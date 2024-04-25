//
//  ContentView.swift
//  For42GS
//
//  Created by Kimdohyun on 3/8/24.
//

import SwiftUI

struct ContentView: View {

//MARK: - 1. PROPERTY
    
    @EnvironmentObject var service : Service
    @State private var selection = 0

//MARK: - 2. BODY
    
    var body: some View {
        TabView(selection: $selection) {
            MyPageView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Page")
                }
                .tag(0)
            
            RankPageView()
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Rank")
                }
                .tag(1)
            
            InfoPageView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Info")
                }
                .tag(2)
        }
        .onAppear {}
        .onChange(of: selection) {}
    }
}

//MARK: - 3. PREVIEW

#Preview {
    ContentView().environmentObject(Service())
}
