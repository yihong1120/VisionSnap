//
//  SwiftUIView.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/7/2.
//

import SwiftUI

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
