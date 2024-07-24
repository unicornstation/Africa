//
//  GalleryView.swift
//  Africa
//
//  Created by Alyona Voronina on 08.07.2024.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // Simple grid definition
    //    let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    //Efficient grid definition
    //  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    @State private var isGridChanged = false
    
//   func gridSwitch() {
//    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
//    }
    
    func gridSwitch() {
            if (isGridChanged) {
                withAnimation {
                    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
                }
            }
            else {
                gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
                isGridChanged = true
            }
        }
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: - SLIDER
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                
                /*               'onChange(of:perform:)' was deprecated in iOS 17.0: Use `onChange` with a two or zero parameter action closure instead.
                 
                 .onChange(of: gridColumn, perform: { value in
                 gridSwitch()
                 }) */
                
                    .onChange(of: gridColumn, gridSwitch)
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    } //: LOOP
                } //: VStack
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            } //: GRID
            
            /*'animation' was deprecated in iOS 15.0: Use withAnimation or animation(_:value:) instead.
             .animation(.easeIn) - changed func gridSwitch() */
             
            .onAppear(perform: {
                gridSwitch()
        })
          
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW
#Preview {
    GalleryView()
        .previewDevice("iPhone 15 Pro")
}
