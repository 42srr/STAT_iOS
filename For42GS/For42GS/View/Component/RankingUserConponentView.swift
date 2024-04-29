//
//  RankingUserConponentView.swift
//  For42GS
//
//  Created by devoogie on 4/25/24.
//

import SwiftUI

struct RankingUserConponentView: View {
    var body: some View {
        HStack{
            
            Text("1")
                .font(.title2)
                .padding()
            UserView()
            Spacer()
            Text("20304")
                .font(.footnote)
                .padding()
        }
        
    }
}

#Preview {
    RankingUserConponentView()
}
