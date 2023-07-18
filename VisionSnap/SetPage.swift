//
//  SetPage.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/7/2.
//

import SwiftUI
import CoreData

struct SetPage: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: VisionSnapEntity.entity(), sortDescriptors: []) var settings: FetchedResults<VisionSnapEntity>
    
    @State private var polygon_opacity: Double = 0.5
    @State private var points_and_lines_opacity: Double = 0

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
                        .onChange(of: polygon_opacity) { _ in
                            saveSettings()
                        }
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
                    saveSettings()
                }) {
                    Text("On")
                        .font(.title2)
                        .padding()
                        .foregroundColor(points_and_lines_opacity == 1 ? .blue : .gray)
                }
                
                Button(action: {
                    self.points_and_lines_opacity = 0
                    saveSettings()
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
        .onAppear() {
            if let setting = settings.first {
                polygon_opacity = setting.polygonOpacity
                points_and_lines_opacity = setting.pointsAndLinesOpacity
            }
        }
    }
    
    func saveSettings() {
        let setting: VisionSnapEntity
        
        if let firstSetting = settings.first {
            setting = firstSetting
        } else {
            setting = VisionSnapEntity(context: managedObjectContext)
        }
        
        setting.polygonOpacity = polygon_opacity
        setting.pointsAndLinesOpacity = points_and_lines_opacity
        
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving settings: \(error)")
        }
    }
}
