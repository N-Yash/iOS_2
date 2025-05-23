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
            ListExample1()
            //ListEample2()
        } // V Stack
        .padding()
    }
}
#Preview {
    ContentView()
}
