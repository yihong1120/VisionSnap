//
//  InfoPage.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/7/2.
//

import SwiftUI

struct InfoPage: View {
    @State private var locations: [CGPoint] = []
    @State private var image: Image? = Image(systemName: "photo")
    
    var body: some View {
        ZStack {
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
                        locations.removeAll()
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
            
            Rectangle()
                .fill(Color.gray)
                .frame(width: 500, height: 350)
                .overlay(
                    ZStack {
                        image?
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { value in
                                        locations.append(value.startLocation)
                                    }
                            )
                        
                        ForEach(locations.indices, id: \.self) { index in
                            Circle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                                .position(x: locations[index].x, y: locations[index].y)
                        }
                    }
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
