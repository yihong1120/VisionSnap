//
//  ImagePicker.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/7/3.
//

import SwiftUI

struct OutputPage: View {
    let list_items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    let list_nums = [[1,2,3], [1,2,3], [1,2,3], [1,2,3], [1,2,3]]
    
    var body: some View {
        HStack(alignment: .center) {
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

            VStack(alignment: .center) {
                Text("Items")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                List(list_items, id: \.self) { item in
                    Text(item)
                }
                .frame(width: 275)
            }
            .offset(x: -20) // 设置 Items 列表的偏移

            Spacer()

            VStack(alignment: .center) {
                Text("Numbers")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                List(list_nums.map { $0.map(String.init) }, id: \.self) { item in
                    Text(item.joined(separator: ", "))
                }
                .frame(width: 275)
            }
            .offset(x: -60) // 设置 Numbers 列表的偏移
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct OutputPage_Previews: PreviewProvider {
    static var previews: some View {
        OutputPage()
    }
}
