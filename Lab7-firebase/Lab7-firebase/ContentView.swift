//
//  ContentView.swift
//  Lab7-Firebase
//
//  Created by Yash Vipul Naik on 2025-08-01.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LocationViewModel()
    @State var latitudeInput: String = ""
    @State var longitudeInput: String = ""
    @State var address: String = ""
    @EnvironmentObject var locationHelper: LocationHelper

    var body: some View {
        TabView {
            Form {
                TextField("Latitude", text: $latitudeInput)
                    .keyboardType(.decimalPad)
                TextField("Longitude", text: $longitudeInput)
                    .keyboardType(.decimalPad)
                
                Button("Get Address & Save") {
                    if let lat = Double(latitudeInput), let lon = Double(longitudeInput) {
                        locationHelper.getAddress(latitude: lat, longitude: lon) { addr in
                            self.address = addr ?? "Unknown"
                            self.viewModel.addLocation(latitude: lat, longitude: lon, address: self.address)
                        }
                    }
                }
                .disabled(latitudeInput.isEmpty || longitudeInput.isEmpty)
                
                if !address.isEmpty {
                    Text("Address: \(address)")
                        .padding(.top)
                }
            }
            .tabItem {
                Label("Insert", systemImage: "plus")
            }
            
            NavigationView {
                List {
                    ForEach(viewModel.locations) { loc in
                        VStack(alignment: .leading) {
                            Text(loc.address)
                            Text("Lat: \(loc.latitude), Lon: \(loc.longitude)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("Saved Locations")
            }
            .onAppear { viewModel.fetchLocations() }
            .tabItem {
                Label("Locations", systemImage: "list.bullet")
            }

            MapView { lat, lon in
                self.latitudeInput = String(lat)
                self.longitudeInput = String(lon)
                locationHelper.getAddress(latitude: lat, longitude: lon) { addr in
                    self.address = addr ?? "Unknown"
                    self.viewModel.addLocation(latitude: lat, longitude: lon, address: self.address)
                }
            }
            .tabItem {
                Label("Map", systemImage: "map")
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let locationToDelete = viewModel.locations[index]
            viewModel.deleteLocation(locationId: locationToDelete.id)
        }
    }
}
