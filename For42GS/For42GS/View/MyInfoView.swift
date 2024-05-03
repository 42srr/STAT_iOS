//
//  MyInfoView.swift
//  For42GS
//
//  Created by devoogie on 4/25/24.
//

import SwiftUI

struct MyInfoView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing : 32){
                    ProgressInfoView(model: ProgressModel(name: "블랙홀" ,progress: 0.2))
                    ProgressInfoView(model: ProgressModel(name: "블랙홀" ,progress: 0.2))
                    ProgressInfoView(model: ProgressModel(name: "블랙홀" ,progress: 0.2))
                    ProgressInfoView(model: ProgressModel(name: "블랙홀" ,progress: 0.2))
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Image("Logo")
                        .resizable()
                        .frame(width: 100)
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.orange)
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(systemName: "gear")
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

#Preview {
    MyInfoView()
}
