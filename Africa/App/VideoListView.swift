//
//  VideoListView.swift
//  Africa
//
//  Created by Alyona Voronina on 08.07.2024.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    
    var videos: [Video] = Bundle.main.decode("videos.json")
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                }
                
            } //: LIST
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
            .previewDevice("iPhone 15 Pro")
    }
}
