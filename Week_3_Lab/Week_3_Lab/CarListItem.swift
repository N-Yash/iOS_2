//
//  CarListitem.swift
//  Week_3_Lab
//
//  Created by Yash Vipul Naik on 2025-05-23.
//

import SwiftUI

struct CarListItem: View {
    
    let car : Car
    var body: some View {
        HStack{
            
            VStack(alignment: .leading){
                Text(car.model)
                    .font(.headline)
                Text(car.make)
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: car.isFavorite ? "star.fill" : "star")
        } //HStake
        .onTapGesture {
            print("Tapped Gesture: \(car.model)")
        }
        .onLongPressGesture {
            print("Long Tapped: \(car.model)")
        }
    }
}

