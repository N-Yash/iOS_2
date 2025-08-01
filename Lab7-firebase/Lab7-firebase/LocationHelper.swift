//
//  LocationHelper.swift
//  Lab7-Firebase
//
//  Created by Yash Vipul Naik on 2025-08-01.
//

import Foundation
import CoreLocation

class LocationHelper: NSObject, ObservableObject {
    
    private let geoCoder = CLGeocoder()
    
    func getAddress(latitude: Double, longitude: Double, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            if let firstPlace = placemarks?.first {
                let street = firstPlace.thoroughfare ?? ""
                let postalCode = firstPlace.postalCode ?? ""
                let country = firstPlace.country ?? ""
                let province = firstPlace.administrativeArea ?? ""
                
                var addressComponents = [String]()
                if !street.isEmpty { addressComponents.append(street) }
                if !postalCode.isEmpty { addressComponents.append(postalCode) }
                if !province.isEmpty { addressComponents.append(province) }
                if !country.isEmpty { addressComponents.append(country) }
                
                let address = addressComponents.joined(separator: ", ")
                completion(address.isEmpty ? "Unknown Address" : address)
            } else {
                completion(nil)
            }
        }
    }
}
