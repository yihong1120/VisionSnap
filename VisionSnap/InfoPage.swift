//
//  InfoPage.swift
//  VisionSnap
//
//  Created by WONG YI HUNG on 2023/7/2.
//

import SwiftUI
import CoreData

struct CodablePoint: Codable {
    var x: CGFloat
    var y: CGFloat

    init(from point: CGPoint) {
        self.x = point.x
        self.y = point.y
    }

    var cgPoint: CGPoint {
        return CGPoint(x: x, y: y)
    }
}

struct InfoPage: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: VisionSnapEntity.entity(), sortDescriptors: []) var settings: FetchedResults<VisionSnapEntity>
    
    @State private var locations: [CGPoint] = []
    @State private var polygons: [[CGPoint]] = [] {
        didSet {
            updatePolygonsInCoreData()
        }
    }
    @State private var uiImage: UIImage? = nil
    @State private var image: Image? = Image(systemName: "photo")
    @State private var polygon_opacity: Double = 0.5
    private let closingDistance: CGFloat = 20.0

    @State private var isImagePickerDisplayed = false {
        didSet {
            updateIsImagePickerDisplayedInCoreData()
        }
    }

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
                        ImagePicker(image: $uiImage)
                    }
                    .onChange(of: uiImage) { newValue in
                        if let validImage = newValue {
                            image = Image(uiImage: validImage)
                        }
                    }

                    Button(action: {
                        print("Real-Time Camera")
                    }) {
                        Image(systemName: "video")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.bottom, 10)

                    Button(action: {
                        polygons.removeAll()
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
                        print(polygons)
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
                                            if self.locations.count >= 2,
                                               self.isPoint(value.startLocation, closeTo: self.locations.first!) {
                                                self.polygons.append(self.locations)
                                                self.locations = []
                                            } else {
                                                self.locations.append(value.startLocation)
                                            }
                                        }
                                )

                            ForEach(polygons.indices, id: \.self) { index in
                                let polygon = polygons[index]
                                Path { path in
                                    guard let firstPoint = polygon.first else { return }
                                    path.move(to: firstPoint)
                                    for point in polygon.dropFirst() {
                                        path.addLine(to: point)
                                    }
                                    path.closeSubpath()
                                }
                                .fill(Color.red.opacity(polygon_opacity)) // Fill with color
                                .stroke(Color.red, lineWidth: 2)
                                
                                ForEach(polygon.indices, id: \.self) { pointIndex in
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 10, height: 10)
                                        .position(x: polygon[pointIndex].x, y: polygon[pointIndex].y)
                                }
                            }

                            ForEach(locations.indices, id: \.self) { index in
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 10, height: 10)
                                    .position(x: locations[index].x, y: locations[index].y)
                            }

                            if locations.count >= 2 {
                                Path { path in
                                    path.move(to: locations.first!)
                                    for index in 1..<locations.count {
                                        path.addLine(to: locations[index])
                                    }
                                }
                                .stroke(Color.red, lineWidth: 2)
                            }

                        }
                    )
                    .offset(x: 20, y: 0)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear() {
            if let setting = settings.first {
                polygon_opacity = setting.polygonOpacity
                if let data = setting.polygons {
                    let codablePolygons = try? JSONDecoder().decode([[CodablePoint]].self, from: data)
                    polygons = codablePolygons?.map { $0.map { $0.cgPoint } } ?? []
                }
            }
        }
    }
    
    private func isPoint(_ point1: CGPoint, closeTo point2: CGPoint) -> Bool {
        let dx = point1.x - point2.x
        let dy = point1.y - point2.y
        return sqrt(dx * dx + dy * dy) < closingDistance
    }
    
    private func updateIsImagePickerDisplayedInCoreData() {
        if let setting = settings.first {
            setting.isImagePickerDisplayed = isImagePickerDisplayed
            do {
                try managedObjectContext.save()
            } catch {
                print("無法儲存 isImagePickerDisplayed 到 CoreData")
            }
        } else {
            let newSetting = VisionSnapEntity(context: managedObjectContext)
            newSetting.isImagePickerDisplayed = isImagePickerDisplayed
            do {
                try managedObjectContext.save()
            } catch {
                print("無法創建新的設定並儲存到 CoreData")
            }
        }
    }
    
    private func updatePolygonsInCoreData() {
        let codablePolygons = polygons.map { $0.map { CodablePoint(from: $0) } }
        let data = try? JSONEncoder().encode(codablePolygons)

        if let setting = settings.first {
            setting.polygons = data
            do {
                try managedObjectContext.save()
            } catch {
                print("無法儲存 polygons 到 CoreData")
            }
        } else {
            let newSetting = VisionSnapEntity(context: managedObjectContext)
            newSetting.polygons = data
            do {
                try managedObjectContext.save()
            } catch {
                print("無法創建新的設定並儲存到 CoreData")
            }
        }
    }
}
