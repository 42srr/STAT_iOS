//
//  RankPageView.swift
//  For42GS
//
//  Created by Kimdohyun on 4/25/24.
//

import SwiftUI

struct RankPageView: View {
    
    //MARK: - 1. PROPERTY
    @EnvironmentObject var service: Service
    
    //MARK: - 2. BODY
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    FirstPageView()
                    SecondPageView()
                    ThirdPageView()
                }
            }
            .frame(width: UIScreen.getWidth(350), height: UIScreen.getHeight(600))
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
        .padding(.top, 30)
    }
}

struct FirstPageView: View {
    var body: some View {
        ZStack {
            self.roundedPageStyle()
            LineChartView()
        }
    }
}

struct SecondPageView: View {
    var body: some View {
        ZStack {
            self.roundedPageStyle()
            BarChartView()
        }
    }
}

struct ThirdPageView: View {
    var body: some View {
        ZStack {
            self.roundedPageStyle()
            PieChartView()
        }
    }
}

extension View {
    func roundedPageStyle() -> some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: UIScreen.getWidth(320), height: UIScreen.getHeight(520))
            .shadow(color: .black.opacity(0.2), radius: UIScreen.getHeight(10), x: 0, y: UIScreen.getHeight(10))
            .padding()
    }
}

#Preview {
    RankPageView().environmentObject(Service())
}
