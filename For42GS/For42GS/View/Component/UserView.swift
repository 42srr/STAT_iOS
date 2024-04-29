//
//  RankUserView.swift
//  For42GS
//
//  Created by devoogie on 4/25/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        HStack
        {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40,height: 40)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
            Text("junmin")
        }
        
    }
}

#Preview {
    UserView()
}
