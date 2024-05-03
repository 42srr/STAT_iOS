//
//  RankPageView.swift
//  For42GS
//
//  Created by Kimdohyun on 4/25/24.
//

import SwiftUI

struct RankPageView: View {
    let items = ["level", "exp", "coalition", "comment length"]
    @State private var selectedItem = "level" // 선택된 항목을 추적


    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .padding()
                            .foregroundColor(self.selectedItem == item ? .orange : Color.gray) // 선택된 항목은 파란색, 그 외는 회색
                            .onTapGesture {
                                self.selectedItem = item
                            }
                    }
                }
                .padding()
            }
                RankingListView()
            }
        }
    }

#Preview {
    RankPageView()
}
