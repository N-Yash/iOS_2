//
//  SignInScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct SignInScreen: View {
    @State private var email : String = "e@mial.com"
    @State private var password : String = "password"
    
    @Binding var authFlow: AuthFlow
    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter Email", text: $email)
                SecureField("Enter Password", text: $password)
                Button("Sign In"){
                    if (!email.isEmpty && !password.isEmpty)
                    {
                        authFlow = .home
                    }
                    
                }.buttonStyle(.borderedProminent)
                Button("Login"){}
            }
        }
        .navigationTitle("SignIn")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

