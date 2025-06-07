//
//  RecordsScreen.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct RecordsScreen: View {

    @State private var history : String = "No History"
    @State private var allergy : String = "Dairy"
    
    @EnvironmentObject var user : User
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section("Histroy"){
                        TextField("Enter Name", text: $history)
                    }
                    Section("Allergy"){
                        TextField("Enter Email", text: $allergy)
                    }
                    
                    Button("Update"){
                        if (!history.isEmpty && !allergy.isEmpty){
                            
                            user.history = history
                            user.allergy = allergy
                            
                            dismiss()
                        }
                    }
                }
                .navigationTitle("\(user.name)'s Records")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(){
                    history = user.history
                    allergy = user.allergy
                }
            }
        }
    }
}

#Preview {
    RecordsScreen()
        .environmentObject(User(name: "Example", email: "sample@apple.com", history: "No History", allergy: "Dairy"))
}
