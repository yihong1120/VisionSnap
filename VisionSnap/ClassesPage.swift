//
//  SwiftUIView1.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/7/2.
//

import SwiftUI

struct ClassesPage: View {
    @State private var selectedIndices1: Set<Int> = []
    @State private var selectedIndices2: Set<Int> = []

    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    let options = ["voiture", "moto", "velo"]

    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Spacer()

                Button(action: {
                    // 書寫筆按鈕的操作
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
                    // 眼睛按鈕的操作
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

            // First Box
            VStack(alignment: .center) {
                Text("Items")
                    .font(.headline)
                    .padding(.bottom, 5)

                List {
                    ForEach(0..<items.count, id: \.self) { index in
                        HStack {
                            Text(items[index])
                            Spacer()
                            Image(systemName: self.selectedIndices1.contains(index) ? "checkmark.square" : "square")
                        }
                        .contentShape(Rectangle()) // 设置可点击的形状为矩形
                        .onTapGesture {
                            if self.selectedIndices1.contains(index) {
                                self.selectedIndices1.remove(index)
                            } else {
                                self.selectedIndices1.insert(index)
                            }
                        }
                    }
                }
                .frame(width: 275)
            }
            .offset(x: -20) // 设置 Items 列表的偏移

            Spacer()

            // Second Box
            VStack(alignment: .center) {
                Text("Numbers")
                    .font(.headline)
                    .padding(.bottom, 5)

                List {
                    ForEach(0..<options.count, id: \.self) { index in
                        HStack {
                            Text(options[index])
                            Spacer()
                            Image(systemName: self.selectedIndices2.contains(index) ? "checkmark.square" : "square")
                        }
                        .contentShape(Rectangle()) // 设置可点击的形状为矩形
                        .onTapGesture {
                            if self.selectedIndices2.contains(index) {
                                self.selectedIndices2.remove(index)
                            } else {
                                self.selectedIndices2.insert(index)
                            }
                        }
                    }
                }
                .frame(width: 275)
            }
            .offset(x: -60) // 设置 Numbers 列表的偏移

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ClassesPage_Previews: PreviewProvider {
    static var previews: some View {
        ClassesPage()
    }
}
