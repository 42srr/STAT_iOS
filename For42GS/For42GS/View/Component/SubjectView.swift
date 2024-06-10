//
//  SubjectView.swift
//  For42GS
//
//  Created by devoogie on 6/10/24.
//

import SwiftUI

struct SubjectView: View {
    var body: some View {
        ScrollView{
            VStack {
                Text("🔥 현재 경산 42 현황")
                    .font(.largeTitle)
                    .padding()
                
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 0.9, green: 0.9, blue: 0.9)) // 라이트 그레이 색상 채우기
                        VStack {
                            Text("현재 사람들이 참여하는 과제")
                                .font(.headline)
                            PieChartView(data: [10, 20, 30, 40], labels: ["과목1", "과목2", "과목3", "과목4"])
                                .frame(height: 200)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }.padding(20)
                    
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.9, green: 0.9, blue: 0.9)) // 라이트 그레이 색상 채우기
                            
                            VStack {
                                Text("여행 중인 유저 레벨 분포")
                                    .font(.headline)
                                PieChartView(data: [5, 10, 15, 20,30], labels: ["lv1", "lv2", "lv3", "lv4","lv5","lv6"])
                                    .frame(height: 200)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                    }.padding(20)
                }
                    .padding()
                }
            }

    }
}

struct BarChartView: View {
    var data: [Double]
    var labels: [String]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            ForEach(0..<data.count) { index in
                VStack {
                    Text("\(Int(self.data[index]))")
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 20, height: CGFloat(self.data[index]) * 10)
                    Text(self.labels[index])
                }
            }
        }
    }
}

#Preview {
    SubjectView()
}
