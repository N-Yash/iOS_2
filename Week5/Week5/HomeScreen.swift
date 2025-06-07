//
//  HomeScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct HomeScreen: View {
    
    @Binding var authFlow: AuthFlow
    @State private var showProfile : Bool = false
    @State private var showRecords : Bool = false
    
    @EnvironmentObject var user : User
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Welcome, \(user.name)")
                Spacer()
                
                Form {
                    Section("E - Mail"){
                        Text(user.email)
                    }
                    
                    Section("Medical Histroy"){
                        Text(user.history)
                    }
                    
                    Section("Allergy"){
                        Text(user.allergy)
                    }
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Menu{
                        Button("Profile"){
                            showProfile = true
                        }//btn
                        Button("Recoards"){
                            showRecords = true
                        }//btn
                        Button("Logout"){
                            authFlow = .signIn
                        }//btn
                    }label: {
                        Image(systemName: "gear")
                    }
                }//bar item
            }//
            .navigationDestination(isPresented: $showProfile){
                ProfileScreen().environmentObject(user)
            }
            .navigationDestination(isPresented: $showRecords){
                RecordsScreen().environmentObject(user)
            }
        }//navigation
    }//body
}

#Preview {
    HomeScreen(authFlow: .constant(.home))
        .environmentObject(User(name: "Example", email: "sample@apple.com", history: "No History", allergy: "Dairy"))
}
