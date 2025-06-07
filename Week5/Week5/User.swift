//
//  User.swift
//  Week5
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import Foundation

class User : ObservableObject{
    
    @Published var name : String
    @Published var email : String
    @Published var history : String
    @Published var allergy : String
    
    init(name: String, email: String, history: String, allergy: String) {
        self.name = name
        self.email = email
        self.history = history
        self.allergy = allergy
    }
    
    init()
    {
        self.name = "NA"
        self.email = "NA"
        self.history = "NA"
        self.allergy = "NA"
    }

}
