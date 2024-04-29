//
//  ProgressView.swift
//  For42GS
//
//  Created by devoogie on 4/25/24.
//

import SwiftUI

struct ProgressView: View {
    @ObservedObject var model: ProgressModel // 진행률 데이터 모델
    
    var body: some View {
        ZStack {
            Circle() // 전체 원을 그립니다.
                .stroke(lineWidth: 30)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            Circle() // 진행률에 따라 채워지는 원
                .trim(from: 0.0, to: CGFloat(min(self.model.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.accentColor)
                .rotationEffect(Angle(degrees: 270.0)) // 그래프가 상단에서 시작하도록 회전
                .animation(.linear, value: model.progress)
            
            Text("\(Int(self.model.progress * 100))%") // 진행률 표시
                .font(.largeTitle)
                .bold()
        }
        .padding(20) // 패딩을 추가하여 뷰에 여유를 줍니다.
    }
}

#Preview {
    ProgressView(model: ProgressModel(name : "",progress: 0.8))
}
