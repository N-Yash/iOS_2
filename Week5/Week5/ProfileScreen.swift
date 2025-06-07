//
//  ProfileScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct ProfileScreen: View {
    
    @State private var email : String = "admin@example.com"
    @State private var name : String = "example"
    
    @EnvironmentObject var user : User
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        NavigationStack{
            VStack{
                Form{
                    Section("Name"){
                        TextField("Enter Name", text: $name)
                    }
                    Section("Email"){
                        TextField("Enter Email", text: $email)
                    }
                    
                    Button("Update"){
                        if (!email.isEmpty && !name.isEmpty){
                            
                            user.email = email
                            user.name = name
                            
                            dismiss()
                        }
                    }
                }
                .navigationTitle("\(user.name)'s Profile")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(){
                    email = user.email
                    name = user.name
                }
            }
        }
    }
}

#Preview {
    ProfileScreen()
        .environmentObject(User(name: "Example", email: "sample@apple.com", history: "No History", allergy: "Dairy"))
}
