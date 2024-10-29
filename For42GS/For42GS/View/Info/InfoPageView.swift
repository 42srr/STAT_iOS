//
//  InfoPageView.swift
//  For42GS
//
//  Created by Kimdohyun on 4/25/24.
//

import SwiftUI

struct InfoPageView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing : 32){
//                    ProgressInfoView(model: ProgressModel(name: "블랙홀" ,progress: 0.2))
//                    ProgressInfoView(model: ProgressModel(name: "블랙홀" ,progress: 0.2))
//                    ProgressInfoView(model: ProgressModel(name: "블랙홀" ,progress: 0.2))
//                    ProgressInfoView(model: ProgressModel(name: "블랙홀" ,progress: 0.2))
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Image("tool_logo")
                        .resizable()
                        .frame(width: 120)
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
    InfoPageView()
}
