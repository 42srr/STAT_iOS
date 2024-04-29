//
//  RankingView.swift
//  For42GS
//
//  Created by devoogie on 4/25/24.
//

import SwiftUI

struct RankingView: View {
    let items = ["level", "exp", "coalition", "comment length"]
    @State private var selectedItem = "level" // 선택된 항목을 추적


    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { // 수평 스크롤 뷰
            HStack(spacing: 20) { // 항목들을 수평으로 배열
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .padding()
                        .foregroundColor(self.selectedItem == item ? .orange : Color.gray) // 선택된 항목은 파란색, 그 외는 회색
                        .onTapGesture {
                            self.selectedItem = item
                        }
                }
            }
            .padding(.horizontal) // 수평 패딩
            RankingListView()
        }
        

    }
}

#Preview {
    RankingView()
}
