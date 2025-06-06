//
//  HomeScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct HomeScreen: View {
    
    @Binding private var authFlow : AuthFlow
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Welcome, ")
                Spacer()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Menu{
                        Button("Profile"){
                            
                        }//btn
                        Button("Account"){
                            
                        }//btn
                        Button("Logout"){
                            
                        }//btn
                    }label: {
                        Image(systemName: "gear")
                    }
                }//bar item
            }//
        }//navigation
    }//body
}

#Preview {
    HomeScreen()
}
