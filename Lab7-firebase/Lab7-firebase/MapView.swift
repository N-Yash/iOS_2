//
//  MapView.swift
//  Lab7-Firebase
//
//  Created by Yash Vipul Naik on 2025-08-01.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.6532, longitude: -79.3832), // Toronto
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    @State private var selectedLocation: CLLocationCoordinate2D?
    var onLocationSelected: (Double, Double) -> Void

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: selectedLocation == nil ? [] : [SelectedPoint(coordinate: selectedLocation!)]) { location in
            MapAnnotation(coordinate: location.coordinate) {
                VStack {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.title)
                        .foregroundColor(.red)
                    // The pin's base is where the coordinate points, so we offset it.
                        .offset(y: -15)
                }
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            // Convert the drag location to a new coordinate
                            if let newCoordinate = self.region.center.coordinate(with: gesture.location, in: self.region.span) {
                                self.selectedLocation = newCoordinate
                            }
                        }
                        .onEnded { _ in
                            // On drag end, update the parent view
                            if let coordinate = self.selectedLocation {
                                self.onLocationSelected(coordinate.latitude, coordinate.longitude)
                            }
                        }
                )
            }
        }
        .onTapGesture { screenPoint in
            // Use the map reader to convert the tap location to a coordinate
            if let coordinate = region.center.coordinate(with: screenPoint, in: region.span) {
                selectedLocation = coordinate
                onLocationSelected(coordinate.latitude, coordinate.longitude)
            }
        }
        .navigationTitle("Select on Map")
    }
}

// A helper extension to convert a screen point to a map coordinate
extension CLLocationCoordinate2D {
    func coordinate(with point: CGPoint, in span: MKCoordinateSpan) -> CLLocationCoordinate2D? {
        let mercatorX = (self.longitude + 180) / 360 * Double(256 << 20)
        let mercatorY = (1 - log(tan(self.latitude * .pi / 180) + 1 / cos(self.latitude * .pi / 180)) / .pi) / 2 * Double(256 << 20)
        let newX = mercatorX + Double(point.x) * (span.longitudeDelta / 360) * Double(256 << 20)
        let newY = mercatorY - Double(point.y) * (span.latitudeDelta / 180) * Double(256 << 20)
        
        let newLongitude = newX / Double(256 << 20) * 360 - 180
        let newLatitude = atan(sinh(.pi * (1 - newY / Double(256 << 20) * 2))) * 180 / .pi
        
        return CLLocationCoordinate2D(latitude: newLatitude, longitude: newLongitude)
    }
}

// Helper struct for the annotation item
struct SelectedPoint: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
