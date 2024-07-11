//
//  HeadingView.swift
//  Africa
//
//  Created by Alyona Voronina on 11.07.2024.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - PROPERTIES
    
    var headingImage: String
    var headingText: String
    
    var body: some View {
        HStack {
            
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        .previewLayout(.sizeThatFits)
        .padding()
}
