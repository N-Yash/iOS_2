//
//  ContentView.swift
//  Week_2_Lab
//
//  Created by Yash Vipul Naik on 2025-05-16.
//

import SwiftUI

struct ContentView: View {
    
    let kits = ["Survival Kits", "Radiation Protection Kit", "Gas Masks", "Fire Protection Kits"]
    @State private var selectedKit: String = "Survival Kits"
    @State private var address: String = ""
    @State private var numberOfPeople: Int = 1
    @State private var isReceived: Bool = false
    @State private var showAlert: Bool = false
    @State private var showAlert2: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                
                Form{
                    
                    Section(header: Text("Address")){
                        HStack{
                            Text("Addrss")
                            Divider()
                            TextField(text: $address, prompt: Text("Required")){}
                        }
                    } // Section
                    
                    Section(header: Text("Number of People")){
                        Stepper(value: $numberOfPeople, in: 0...5){
                            Text("Number of People: \(self.numberOfPeople)")
                        }
                    } // Section
                    
                    Section(header: Text("Resivied Kit?")){
                        Toggle("Resivied Kit?", isOn: $isReceived)
                    } // Section
                    
                    Section(header: Text("Select Kit")){
                        Picker("Select a Kit", selection: $selectedKit){
                            ForEach(kits, id: \.self){ kit in
                                Text(kit)
                            }
                        }.pickerStyle(.menu)
                    }
                    
                    Button{
                        if address.isEmpty{
                            errorTitle = "Enter all Data!"
                            errorMessage = "You need to fill all field."
                            showAlert = true
                        }
                        else if isReceived{
                            errorTitle = "Already Received"
                            errorMessage = "Kit is already received and it cannot be received more than 1 time."
                            showAlert = true
                        }
                        else {
                            errorTitle = "Order is Received"
                            errorMessage = "Your order is received at address: \(address)"
                            showAlert = true
                        }
                    } label: {
                        Text("Place Order")
                    }.alert(isPresented: $showAlert){
                        Alert(title: Text(errorTitle),
                                          message: Text(errorMessage))
                    }
                    
                    
                    
                } //form
            } // Vstack
            
            .navigationTitle("Yash Naik")
            .navigationBarTitleDisplayMode(.inline)
        } //naigation
        
    } //body
}

#Preview {
    ContentView()
}
