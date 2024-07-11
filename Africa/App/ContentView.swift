//
//  ContentView.swift
//  Africa
//
//  Created by Alyona Voronina on 05.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // MARK: - PROPERTIES
        
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        // MARK: - BODY
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal))  {
                        AnimalListItemView(animal: animal)
                    } //Link
                } //Loop
                }//: List
                .navigationBarTitle("Africa", displayMode: .large)
            }//: Navigation
        }
    }

    
    struct ContentView_Preview: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 15 Pro")
        }
    }

