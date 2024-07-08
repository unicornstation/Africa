//
//  MainView.swift
//  Africa
//
//  Created by Alyona Voronina on 08.07.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            ContentView()
                .tabItem { Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            VideoListView()
                .tabItem { Image(systemName: "play.rectangle")
                Text("Watch")
                }
            MapView()
                .tabItem { Image(systemName: "map")
                    Text("Location")
                }
            GalleryView()
                .tabItem { Image(systemName: "photo")
                    Text("Gellery")
                }
        }
    }
}


#Preview {
    MainView()
}
