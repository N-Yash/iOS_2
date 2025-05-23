//
//  ListExample1.swift
//  Week_3_Lab
//
//  Created by Yash Vipul Naik on 2025-05-23.
//

import SwiftUI

struct ListExample1: View {
    
    @State private var cars = Car.getSampleCars()
    @State private var searchCarModel : String = ""
    var body: some View {
        
        NavigationStack{
            
            List{
                ForEach(searchCar(searchItem: searchCarModel)) { car in
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
                } //For Each
                .onMove{source, destination in
                   cars.move(fromOffsets: source, toOffset: destination)
                }
                .onDelete(perform: { indexSet in
                    cars.remove(atOffsets: indexSet)
                })
            } //List
            .searchable(text: $searchCarModel, prompt: "Search Car Model")
            
            .navigationTitle("Interactive List")
            .navigationBarTitleDisplayMode(.inline)
        } //Nav
        
        
    }
    
    private func searchCar(searchItem : String) -> [Car]{
        
        if(searchItem.isEmpty){
            return cars
        } else {
            var results : [Car] = []
            
            for car in cars {
                // case sensitive
                if(car.model.contains(searchItem)){
                    results.append(car)
                }
            }
            return results
        }
    }
}

#Preview {
    ListExample1()
}
