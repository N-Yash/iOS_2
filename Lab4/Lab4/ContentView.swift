//
//  ContentView.swift
//  Lab4
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var quantity: String = "0"
    @State private var showOverviewScreen: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Product") {
                        Text("Coffee")
                        TextField("Quantity", text: $quantity)
                            .keyboardType(.numberPad)
                    }

                    Button {
                        if let quantityInt = Int(quantity) {
                            if quantityInt > 0 {
                                self.showOverviewScreen = true
                            } else {
                                alertMessage = "Quantity must be greater than 0."
                                showAlert = true
                            }
                        } else {
                            alertMessage = "Please enter a valid numeric value."
                            showAlert = true
                        }
                    } label: {
                        Text("Continue")
                    }
                    .alert("Invalid Input", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text(alertMessage)
                    }
                }
            }
            .navigationDestination(isPresented: $showOverviewScreen) {
                OverviewScreen(quantity: quantity)
            }
            .navigationTitle("Yash Naik")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
