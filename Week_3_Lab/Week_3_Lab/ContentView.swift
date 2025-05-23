//
//  ContentView.swift
//  Week_3_Lab
//
//  Created by Yash Vipul Naik on 2025-05-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var birthDate : Date = Date.now
    
    var body: some View {
        VStack {
            DatePicker("BirthDate: ", 
                       selection: $birthDate,
                       in: ...Calendar.current.date(byAdding: .year, value: -16, to: Date.now)!,
                       displayedComponents: .date)
            .datePickerStyle(.compact) //
            
            Text("BirthDate: \(birthDate)")
            
            ListExample1()
        } // V Stack
        .padding()
    }
}

#Preview {
    ContentView()
}
