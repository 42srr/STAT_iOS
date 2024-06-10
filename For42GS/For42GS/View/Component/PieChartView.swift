//
//  PieChartView.swift
//  For42GS
//
//  Created by devoogie on 6/10/24.
//

import SwiftUI

struct PieChartView: View {
    var data: [Double]
    var labels: [String]
    
    var colors: [Color] = [.red, .green, .blue, .orange,.yellow,.purple,.pink]
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack {
                    Spacer()
                    ZStack {
                        ForEach(0..<self.data.count) { index in
                            PieSliceView(startAngle: self.angle(for: index, in: self.data),
                                         endAngle: self.angle(for: index + 1, in: self.data),
                                         color: self.colors[index % self.colors.count])
                        }
                    }
                    .frame(width: min(geometry.size.width, geometry.size.height),
                           height: min(geometry.size.width, geometry.size.height))
                    Spacer()
                }
            }
            .frame(height: 200)
            
            HStack {
                ForEach(0..<self.data.count) { index in
                    HStack {
                        Circle()
                            .fill(self.colors[index % self.colors.count])
                            .frame(width: 10, height: 10)
                        Text(self.labels[index])
                    }
                }
            }
        }
    }
    
    private func angle(for index: Int, in data: [Double]) -> Angle {
        let total = data.reduce(0, +)
        let current = data.prefix(index).reduce(0, +)
        return Angle(degrees: 360 * (current / total))
    }
}

struct PieSliceView: View {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
    
    var body: some View {
        Path { path in
            let center = CGPoint(x: 100, y: 100)
            path.move(to: center)
            path.addArc(center: center, radius: 100, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
        .fill(color)
    }
}

#Preview {
    PieChartView(data: [10, 20, 30, 40], labels: ["과목1", "과목2", "과목3", "과목4"])
}
