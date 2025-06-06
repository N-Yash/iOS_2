//
//  ContentView.swift
//  Lab5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct ContentView: View {
    @State var authFlow : AuthFlow = .signIn
    var body: some View {
        switch authFlow {
        case .signIn:
            TestScreen()
        case .signUp:
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        case .home:
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        case .profile:
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        case .records:
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
        }
        
    
    }
}

enum AuthFlow {
    case signIn
    case signUp
    case home
    case profile
    case records
}

#Preview {
    ContentView()
}
