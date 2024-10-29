//
//  ChartView.swift
//  For42GS
//
//  Created by Kimdohyun on 10/15/24.
//

import SwiftUI
import Charts

struct LineChartView: View {
    
    @EnvironmentObject var service: Service
    
    let data: [(String, Double)] = [("Jan", 30), ("Feb", 40), ("Mar", 45), ("Apr", 50)]
    
    var body: some View {
        Chart(data, id: \.0) { entry in
            LineMark(
                x: .value("Month", entry.0),
                y: .value("Value", entry.1)
            )
        }
        .frame(height: 200)
        .padding()
    }
}

struct BarChartView: View {
    let data: [(String, Double)] = [("A", 10), ("B", 20), ("C", 30), ("D", 25)]
    
    var body: some View {
        Chart(data, id: \.0) { entry in
            BarMark(
                x: .value("Category", entry.0),
                y: .value("Value", entry.1)
            )
        }
        .frame(height: 200)
        .padding()
    }
}

struct PieChartView: View {
    let data: [(String, Double)] = [("Red", 30), ("Blue", 50), ("Green", 20)]
    
    var body: some View {
        Chart(data, id: \.0) { entry in
            SectorMark(
                angle: .value("Value", entry.1),
                innerRadius: .ratio(0.5),
                angularInset: 2
            )
        }
        .frame(height: 200)
        .padding()
    }
}

#Preview {
//    PieChartView()
//    BarChartView()
    LineChartView()
}
