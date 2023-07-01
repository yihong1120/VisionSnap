//
//  ContentView.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Main content view
            VStack {
                if selectedTab == 0 {
                    InfoPage()
                } else if selectedTab == 1 {
                    OutputPage()
                } else if selectedTab == 2 {
                    ClassesPage()
                } else if selectedTab == 3 {
                    SetPage()
                }
                Spacer() // push the content to the top
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            // Sidebar for tabs
            VStack {
                Spacer()
                Button(action: {
                    self.selectedTab = 0
                }) {
                    Text("Info")
                        .font(.title2)
                        .padding()
                        .foregroundColor(selectedTab == 0 ? .blue : .gray)
                }
                
                Button(action: {
                    self.selectedTab = 1
                }) {
                    Text("Output")
                        .font(.title2)
                        .padding()
                        .foregroundColor(selectedTab == 1 ? .blue : .gray)
                }
                
                Button(action: {
                    self.selectedTab = 2
                }) {
                    Text("Classes")
                        .font(.title2)
                        .padding()
                        .foregroundColor(selectedTab == 2 ? .blue : .gray)
                }
                
                Button(action: {
                    self.selectedTab = 3
                }) {
                    Text("Set")
                        .font(.title2)
                        .padding()
                        .foregroundColor(selectedTab == 3 ? .blue : .gray)
                }
                Spacer(minLength: 50) // adjust this padding to move your tab bar up and down
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}

struct InfoPage: View {
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Spacer()
                
                Button(action: {
                    // 相機按鈕的操作
                }) {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    // 清除按鈕的操作
                }) {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    // 開始按鈕的操作
                }) {
                    Image(systemName: "play")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct OutputPage: View {
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Spacer()
                
                Button(action: {
                    // 相機按鈕的操作
                }) {
                    Image(systemName: "hand.point.up")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    // 開始按鈕的操作
                }) {
                    Image(systemName: "camera.metering.matrix")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ClassesPage: View {
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Spacer()
                
                Button(action: {
                    // 相機按鈕的操作
                }) {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    // 開始按鈕的操作
                }) {
                    Image(systemName: "eye")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct SetPage: View {
    @State private var polygon_opacity: Double = 0.5
    @State private var points_and_lines_opacity: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Polygon Opacity: \(String(format: "%.2f", polygon_opacity))")
                .font(.title2)
                .padding()
            
            GeometryReader { geometry in
                Slider(value: $polygon_opacity, in: 0...1, step: 0.01)
                    .frame(width: geometry.size.width - 140) // 設置 Slider 的寬度，留出一些間距
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
