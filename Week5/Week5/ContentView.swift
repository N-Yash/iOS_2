//
//  ContentView.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct ContentView: View {
    @State var authFlow: AuthFlow =  .signIn
    var body: some View {
        switch authFlow {
        case .signIn:
            SignInScreen(authFlow: $authFlow)
        case .signUp:
            SignUpScreen()
        case .home:
            HomeScreen()
        }
    }
}

#Preview {
    ContentView()
}
