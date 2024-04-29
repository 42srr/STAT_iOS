//
//  RankingListView.swift
//  For42GS
//
//  Created by devoogie on 4/25/24.
//

import SwiftUI

struct RankingListView: View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing : 10){
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
                RankingUserConponentView()
            }
            .padding(1)
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

#Preview {
    RankingListView()
}
