//
//  MyPageView.swift
//  For42GS
//
//  Created by Kimdohyun on 4/25/24.
//

import SwiftUI

struct MyPageView: View {
//MARK: - 1. PROPERTY
    
    @EnvironmentObject var service : Service

//MARK: - 2. BODY
    
    var body: some View {
        Text("hi")
    }
}

//MARK: - 3. PREVIEW
#Preview {
    MyPageView().environmentObject(Service())
}
