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
    
    //        @State private var region: MKCoordinateRegion = {
    //                var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    //                var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    //                var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    //
    //                return mapRegion
    //            }()
    
    enum MapDetails {
        static let startingLocation = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        static let defaultSpan      = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    }
    
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan))
    
    @State private var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    @State private var mapSelection: MKMapItem?
    
    @State private var currentCoordinates = CLLocationCoordinate2D()
    
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    
    // MARK: - BODY
    var body: some View {
        
        /* 'init(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:annotationItems:annotationContent:)' was deprecated in iOS 17.0: Use Map initializers that take a MapContentBuilder instead.
         
         Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
         
         'MapAnnotation' was deprecated in iOS 17.0: Use Annotation along with Map initializers that take a MapContentBuilder instead.
         
         MapAnnotation(coordinate: item.location) {
         MapAnnotationView(location: item)
         }
         }) */
        
        Map(position: $cameraPosition, selection: $mapSelection) {
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.location) {
                    MapAnnotationView(location: location)
                }
            }
        }
                .onMapCameraChange { newPosition in
            currentCoordinates.latitude = newPosition.region.center.latitude
            currentCoordinates.longitude = newPosition.region.center.longitude
        }
        .overlay(
            HStack(alignment: .center, spacing:  12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(currentCoordinates.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longituge:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(currentCoordinates.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            } //: HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
    }
}

// MARK: - PREVIEW
#Preview {
    MapView()
        .previewDevice("iPhone 15 Pro")
}
