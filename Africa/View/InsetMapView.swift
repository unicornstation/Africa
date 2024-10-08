//
//  InsetMapView.swift
//  Africa
//
//  Created by Alyona Voronina on 15.07.2024.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - PROPERTIES
    
   // @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)))
    
    // MARK: - BODY
    
    var body: some View {
        
       /* 'init(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:)' was deprecated in iOS 17.0: Use Map initializers that take a MapContentBuilder instead.
     Map(coordinateRegion: $region) */
        
        Map(position: $cameraPosition)
            .overlay(NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal,14)
                    .background(Color.black
                    .opacity(0.4)
                    .cornerRadius(8)
                                )
                } //: NAVIGATION
                .padding(12)
                     , alignment: .topLeading
                )
                    .frame(height: 256)
            .cornerRadius(12)
    }
}

// MARK: - PREVIEW
struct InsetMapView_Preview: PreviewProvider {
    
   static var previews: some View {
        InsetMapView()
           .previewLayout(.sizeThatFits)
           .padding()
    }
}

