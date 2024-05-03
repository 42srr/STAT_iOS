//
//  ProgressInfoView.swift
//  For42GS
//
//  Created by devoogie on 4/25/24.
//

import SwiftUI

struct ProgressInfoView: View {
    @ObservedObject var model: ProgressModel // 진행률 데이터 모델

    var body: some View {
        VStack{
            HStack{
                Text(model.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(20)
                Spacer()
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.9, green: 0.9, blue: 0.9)) // 라이트 그레이 색상 채우기
                    
                    ProgressView(model: model)
                        .padding(20)
                }
        }.padding(20)
    }
}

#Preview {
    ProgressInfoView(model: ProgressModel(name : "블랙홀",progress: 0.8))
}
