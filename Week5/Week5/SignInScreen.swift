//
//  SignInScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct SignInScreen: View {
    
    @State private var name : String = "Yash Naik"
    @State private var email : String = "yashnaik@mail.com"
    
    @Binding var authFlow: AuthFlow
    
    @EnvironmentObject var user : User

    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter Email", text: $email)
                
                SecureField("Enter Name", text: $name)
                
                Button("Sign In"){
                    if (!email.isEmpty && !name.isEmpty)
                    {
                        user.name = name
                        user.email = email
                        
                        authFlow = .home
                    }
                    
                }.buttonStyle(.borderedProminent)
                
                Button("Sign Up"){
                    authFlow = .signUp
                }
            }
            .navigationTitle("Yash Naik | Sign In")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

#Preview {
    SignInScreen(authFlow: .constant(.signIn))
        .environmentObject(User(name: "Example", email: "sample@apple.com", history: "No History", allergy: "Dairy"))
}
