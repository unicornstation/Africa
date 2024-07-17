//
//  VideoModel.swift
//  Africa
//
//  Created by Alyona Voronina on 17.07.2024.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
