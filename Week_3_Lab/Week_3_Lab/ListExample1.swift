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
                    CarListItem(car: car)
                } //For Each
                .onMove{source, destination in
                   cars.move(fromOffsets: source, toOffset: destination)
                }
                .onDelete(perform: { indexSet in
                    cars.remove(atOffsets: indexSet)
                })
                .listRowBackground(
                        Capsule()
                            .fill(Color.gray)
                            .padding(3)
                )
            } //List
            .searchable(text: $searchCarModel, prompt: "Search Car Model")
            .listStyle(.sidebar)
            
            
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
