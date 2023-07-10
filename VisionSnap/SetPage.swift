//
//  SetPage.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/7/2.
//

import SwiftUI

struct SetPage: View {
//    @State private var polygon_opacity: Double = 0.5
//    @State private var points_and_lines_opacity: Double = 0
    
    @AppStorage("polygon_opacity") private var polygon_opacity: Double = 0.5
    @AppStorage("points_and_lines_opacity") private var points_and_lines_opacity: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Polygon Opacity: \(String(format: "%.2f", polygon_opacity))")
                .font(.title2)
                .padding()
            
            GeometryReader { geometry in
                HStack {
                    Spacer()
                    Slider(value: $polygon_opacity, in: 0...1, step: 0.01)
                        .frame(width: geometry.size.width - 240) // 設置 Slider 的寬度，留出一些間距
                    Spacer()
                }
                .padding()
            }
            
            Text("Points and Lines Opacity")
                .font(.title2)
                .padding()
            
            HStack {
                Button(action: {
                    self.points_and_lines_opacity = 1
                }) {
                    Text("On")
                        .font(.title2)
                        .padding()
                        .foregroundColor(points_and_lines_opacity == 1 ? .blue : .gray)
                }
                
                Button(action: {
                    self.points_and_lines_opacity = 0
                }) {
                    Text("Off")
                        .font(.title2)
                        .padding()
                        .foregroundColor(points_and_lines_opacity == 0 ? .blue : .gray)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

//struct SetPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SetPage()
//    }
//}
