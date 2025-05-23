//
//  ListEample2.swift
//  Week_3_Lab
//
//  Created by Yash Vipul Naik on 2025-05-23.
//

import SwiftUI

struct ListEample2: View {
    
    @State private var hyperCars = Car.hyperCarList()
    
    var body: some View {
        VStack{
            
            DisclosureGroup("Hyper Cars"){
                ForEach(hyperCars){ car in
                    CarListItem(car : car)
                }// For Each
                .listRowSeparator(.visible)
                .listRowSeparatorTint(Color.orange)
                .listRowBackground(
                    Capsule()
                        
                )
            } // Disclosure Group
            
        } // VStack
    }
}

#Preview {
    ListEample2()
}
