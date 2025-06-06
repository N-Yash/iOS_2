//
//  CheckoutScreen.swift
//  Lab4
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct CheckoutScreen: View {
    
    let price : Double
    var body: some View {
        
        let tax : Double = price * 13 / 100
        let totalPrice : Double = price + tax
        
        NavigationStack{
            Form{
                Section("Billing"){
                    Text("Price")
                    Text(String(price))
                }//section
                
                Section{
                    Text("Tax (13%)")
                    Text(String(tax))
                }//section
                
                Section{
                    Text("Total Price")
                    Text(String(totalPrice))
                }//section
            }//form
        }//navigation
        .navigationTitle("Checkout")
    }
}

#Preview {
    CheckoutScreen(price: 0)
}
