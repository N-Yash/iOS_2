//
//  ContentView.swift
//  Week_2_Views_Layout
//
//  Created by Yash Vipul Naik on 2025-05-16.
//

import SwiftUI

enum AppTheme : String, CaseIterable, Identifiable{
    case light = "Light"
    case dark = "Dark"
    var id: String { rawValue }
}

struct Contact : Identifiable, Hashable{
    let id = UUID()
    let name : String
    let initial : String
    let phoneNumber : String
}

var contactList : [Contact] = [
    Contact(name: "Yash Naik", initial: "NY", phoneNumber: "1234567890"),
    Contact(name: "Arch Patel", initial: "AP", phoneNumber: "6789012345"),
    Contact(name: "Yatin Parulkar", initial: "PY", phoneNumber: "0987654321"),
    Contact(name: "Het", initial: "H", phoneNumber: "5432167890"),
    Contact(name: "Vatsal Dave", initial: "DV", phoneNumber: "9087653412")
]

let colors = [Color.blue, Color.red, Color.gray, Color.teal]
struct ContentView: View {
    
    let cities = ["Toronto", "Etobicoke", "Brampton", "Nigra"]
    @State private var selectedCity = "Etobicoke"
    @State private var selectedTheme: AppTheme = .light
    @State private var quantity: Int = 1
    @State private var isRegister : Bool = true

    private var colorScheme : ColorScheme{
        switch selectedTheme {
        case .light:
                .light
        case .dark:
                .dark
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Choose a City")){
                        Picker("Choose a City", selection: $selectedCity){
                            ForEach(cities, id: \.self){ city in
                                Text(city)
                            }
                        }.pickerStyle(.automatic) // picker city
                    }// Section picker
                    
                    Section(header: Text("Select Theme")){
                        Picker("Choose a Theme", selection: $selectedTheme){
                            ForEach(AppTheme.allCases, id: \.self){ theme in
                                Text(theme.rawValue)
                            }
                        }.pickerStyle(.segmented) //picker theme
                    } // section theme
                    
                    Section(header: Text("Quantity")){
                        Stepper(value: $quantity, in: 1...10){
                            Text("Quantity: \(self.quantity)")
                        } // Stepper
                    } // Section Quantity
                    
                    Section(header: Text("Registered User?")){
                        Toggle("Registered User?", isOn: $isRegister)
                    } // Section
                    
                    Section(header: Text("Layout Example")){
                        VStack(alignment: .trailing){
                            Text("Vstach Content")
                                .font(.headline)
                            
                            Circle()
                                .fill(Color("Circle"))
                                .frame(height: 100)
                            
                            Rectangle()
                                .fill(Color("Rectangle"))
                                .frame(height: 100)
                            
                            HStack(){
                                Circle()
                                    .fill(Color("Circle"))
                                    .frame(height: 70)
                                
                                Rectangle()
                                    .fill(Color("Rectangle"))
                                    .frame(height: 70)
                                
                                Circle()
                                    .fill(Color("Circle"))
                                    .frame(height: 70)
                                
                                Circle()
                                    .fill(Color.cyan)
                                    .frame(height: 70)
                            } // Hstack
                            .padding()
                            .background(Color.yellow.opacity(0.4))
                            
                            ZStack{
                                Rectangle()
                                    .fill(Color("Rectangle"))
                                    .frame(height: 70)
                                
                                Circle()
                                    .fill(Color("Circle"))
                                    .frame(height: 50)
                                
                                Circle()
                                    .fill(Color.red)
                                    .frame(height: 40)
                            }
                        } //Vstack
                        .padding()
                        .background(Color.yellow.opacity(0.3))
                    } // Section
                    
                    Section(header: Text("Contact")){
                       
                        ScrollView(.horizontal){
                            LazyHStack{
                                ForEach(contactList, id: \.self) { contact in
                                    VStack{
                                        ZStack{
                                            Circle()
                                                .fill(colors.randomElement()!)
                                                .frame(width: 50, height: 50)
                                            Text(contact.initial)
                                                .foregroundStyle(Color.white)
                                                .font(.system(size: 20))
                                        } // Zstack
                                        Text(contact.name)
                                            .font(.system(size: 15))
                                    } //Vstach
                                } // Foreach
                            } // VStack
                        }
                    } //Section
                    
                    Section(header: Text("Gride Example")){
                        Grid(){
                            GridRow{
                                Text("Name")
                                Text("Initial")
                                Text("Phone Number")
                            }
                            .font(.title3)
                            
                            Divider()
                            ForEach(contactList){ contact in
                                GridRow(alignment: .firstTextBaseline){
                                    Text(contact.name)
                                        .gridColumnAlignment(.leading)
                                    Text(contact.initial)
                                        .gridColumnAlignment(.center)
                                    Text(contact.phoneNumber)
                                        .gridColumnAlignment(.trailing)
                                }
                                Divider()
                            }
                        }
                    } // Section
                } // Form
                
            } //Vstack
            
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    
                    Menu {
                        Button{
                            selectedTheme = .light
                        } label: {
                            Text("Reset")
                        }// reset
                        Button{
                            selectedTheme = .dark
                        } label: {
                            Text("Dark Mode")
                        }
                        Button{
                            isRegister.toggle()
                        } label: {
                            Text("Reset Switch")
                        }
                    } label: {
                        Image(systemName: "gear").foregroundColor(.blue)
                    }
                    
                } //toolbar
            }
            .navigationTitle("Views and Layout")
            .navigationBarTitleDisplayMode(.inline)
        } //navigation
        .preferredColorScheme(colorScheme)
    }//body
}

#Preview {
    ContentView()
}
