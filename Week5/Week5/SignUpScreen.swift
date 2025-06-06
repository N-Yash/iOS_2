//
//  SignUpScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct SignUpScreen: View {
    
    @State private var email : String = "e@mial.com"
    @State private var password : String = "password"
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Enter Email", text: $email)
                SecureField("Enter Password", text: $password)
                Button("Create an Account"){}
            }
        }
        .navigationTitle("SignIn")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    SignUpScreen()
}
