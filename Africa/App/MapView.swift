//
//  MapView.swift
//  Africa
//
//  Created by Alyona Voronina on 08.07.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    // MARK: - BODY
    
    var body: some View {
        Map(initialPosition: .region(region), content: {
            ForEach(locations) { item in
                //    Marker(item.name, coordinate: item.location)
                
                Annotation(item.name, coordinate: item.location) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                } //: ANNOTATION
            }
            
        })
    }
}


// MARK: - PREVIEW
#Preview {
    MapView()
        .previewDevice("iPhone 15 Pro")
}
