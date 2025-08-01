//
//  LocationViewModel.swift
//  Lab7-Firebase
//
//  Created by Yash Vipul Naik on 2025-08-01.
//

import Foundation
import FirebaseFirestore

class LocationViewModel: ObservableObject {
    @Published var locations: [Location] = []
    private let db = Firestore.firestore()
    
    func addLocation(latitude: Double, longitude: Double, address: String) {
        db.collection("locations").addDocument(data: [
            "latitude": latitude,
            "longitude": longitude,
            "address": address
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully!")
                self.fetchLocations()
            }
        }
    }
    
    func fetchLocations() {
        db.collection("locations").getDocuments { snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }
            
            self.locations = documents.compactMap { doc in
                let data = doc.data()
                guard
                    let lat = data["latitude"] as? Double,
                    let lon = data["longitude"] as? Double,
                    let address = data["address"] as? String
                else {
                    print("Error parsing document data for document ID: \(doc.documentID)")
                    return nil
                }
                
                return Location(id: doc.documentID, latitude: lat, longitude: lon, address: address)
            }
        }
    }
    
    func deleteLocation(locationId: String) {
        db.collection("locations").document(locationId).delete { error in
            if let error = error {
                print("Error deleting document: \(error)")
            } else {
                print("Document successfully deleted!")
                self.fetchLocations()
            }
        }
    }
}
