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

struct SetPage: View {
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
