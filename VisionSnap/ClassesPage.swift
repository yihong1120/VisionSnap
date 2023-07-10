//
//  ClassesPage.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/7/2.
//

import SwiftUI

let classNames: [Int: String] = [
    0: "person", 1: "bicycle", 2: "car", 3: "motorcycle", 4: "airplane", 5: "bus",
    6: "train", 7: "truck", 8: "boat", 9: "traffic light", 10: "fire hydrant",
    11: "stop sign", 12: "parking meter", 13: "bench", 14: "bird", 15: "cat",
    16: "dog", 17: "horse", 18: "sheep", 19: "cow", 20: "elephant", 21: "bear",
    22: "zebra", 23: "giraffe", 24: "backpack", 25: "umbrella", 26: "handbag",
    27: "tie", 28: "suitcase", 29: "frisbee", 30: "skis", 31: "snowboard",
    32: "sports ball", 33: "kite", 34: "baseball bat", 35: "baseball glove",
    36: "skateboard", 37: "surfboard", 38: "tennis racket", 39: "bottle",
    40: "wine glass", 41: "cup", 42: "fork", 43: "knife", 44: "spoon", 45: "bowl",
    46: "banana", 47: "apple", 48: "sandwich", 49: "orange", 50: "broccoli",
    51: "carrot", 52: "hot dog", 53: "pizza", 54: "donut", 55: "cake", 56: "chair",
    57: "couch", 58: "potted plant", 59: "bed", 60: "dining table", 61: "toilet",
    62: "tv", 63: "laptop", 64: "mouse", 65: "remote", 66: "keyboard", 67: "cell phone",
    68: "microwave", 69: "oven", 70: "toaster", 71: "sink", 72: "refrigerator",
    73: "book", 74: "clock", 75: "vase", 76: "scissors", 77: "teddy bear",
    78: "hair drier", 79: "toothbrush"
]

struct ClassesPage: View {
    @State private var selectedIndices1: Set<Int> = []
    @State private var selectedIndices2: Set<Int> = []

    let options = ["voiture", "moto", "velo"]

    var body: some View {
        let items = Array(0...79).map { classNames[$0] ?? "" }
        
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

//struct ClassesPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassesPage()
//    }
//}
