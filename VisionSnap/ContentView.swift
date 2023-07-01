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
                    PredictionPage()
                } else if selectedTab == 1 {
                    ResultsPage()
                } else if selectedTab == 2 {
                    ClassesPage()
                } else if selectedTab == 3 {
                    SettingsPage()
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
                    Text("Prediction")
                        .font(.title2)
                        .padding()
                        .foregroundColor(selectedTab == 0 ? .blue : .gray)
                }
                
                Button(action: {
                    self.selectedTab = 1
                }) {
                    Text("Results")
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
                    Text("Settings")
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

struct PredictionPage: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Button(action: {
                    // 相機按鈕的操作
                }) {
                    HStack {
                        Image(systemName: "camera")
                        Text("相機")
                            .font(.title2)
                            .padding()
                    }
                }
                
                Button(action: {
                    // 清除按鈕的操作
                }) {
                    HStack {
                        Image(systemName: "trash")
                        Text("清除")
                            .font(.title2)
                            .padding()
                    }
                }
                
                Button(action: {
                    // 開始按鈕的操作
                }) {
                    HStack {
                        Image(systemName: "play")
                        Text("開始")
                            .font(.title2)
                            .padding()
                    }
                }
                
                Spacer()
            }
            
            // 這裡放置右側的內容
            Text("右側的內容")
                .font(.title)
                .padding()
        }
    }
}


struct ResultsPage: View {
    var body: some View {
        Text("Results Page")
            .font(.title)
            .padding()
    }
}

struct ClassesPage: View {
    var body: some View {
        Text("Classes Page")
            .font(.title)
            .padding()
    }
}

struct SettingsPage: View {
    var body: some View {
        Text("Settings Page")
            .font(.title)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
