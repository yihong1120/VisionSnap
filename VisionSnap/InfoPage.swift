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
    @State private var isImagePickerDisplayed = false

    var body: some View {
        HStack {
            VStack {
                VStack(alignment: .center) {
                    Spacer()

                    Button(action: {
                        isImagePickerDisplayed = true
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
                    .sheet(isPresented: $isImagePickerDisplayed) {
                        ImagePicker(image: $image)
                    }

                    Button(action: {
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
                        print(locations)
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

            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 550, height: 350)
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
                    .offset(x: 20, y: 0)  // Add offset here
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
