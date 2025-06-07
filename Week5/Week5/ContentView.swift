//
//  ContentView.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct ContentView: View {
    
    @State var authFlow: AuthFlow =  .signIn
    
    @StateObject var user = User()

    var body: some View {
        
        switch authFlow {
            
        case .signIn:
            SignInScreen(authFlow: $authFlow)
                .environmentObject(user)
        case .signUp:
            SignUpScreen(authFlow: $authFlow)
                .environmentObject(user)
        case .home:
            HomeScreen(authFlow: $authFlow)
                .environmentObject(user)
        case .profile:
            ProfileScreen()
                .environmentObject(user)
        case .records:
            RecordsScreen()
                .environmentObject(user)
    
        }
        
    }
}

#Preview {
    ContentView()
}
