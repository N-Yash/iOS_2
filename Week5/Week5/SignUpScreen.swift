//
//  SignUpScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct SignUpScreen: View {
    
    @State private var name : String = "Yash Naik"
    @State private var email : String = "yashnaik@mail.com"
    @State private var histroy : String = "No History"
    @State private var allergy : String = "Dairy"
    
    @Binding var authFlow: AuthFlow
    
    @EnvironmentObject var user : User
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Name"){
                    TextField("Enter Name", text: $name)
                }
                
                Section("E - Mail"){
                    TextField("Enter Email", text: $email)
                }
                
                Section("Madical History"){
                    TextField("Enter Medical History", text: $histroy)
                }
                
                Section("Allergy"){
                    TextField("Enter Allergy", text: $allergy)
                }
                
                Button("Create an Account"){
                    user.name = name
                    user.email = email
                    user.history = histroy
                    user.allergy =  allergy
                    
                    authFlow = .home
                }
                .onAppear(){
                    name = user.name
                    email = user.email
                    histroy = user.history
                    allergy = user.allergy
                }
            }
            .navigationTitle("Yash Naik | Sign Up")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

#Preview {
    SignUpScreen(authFlow: .constant(.signUp))
        .environmentObject(User(name: "Example", email: "sample@apple.com", history: "No History", allergy: "Dairy"))
}
