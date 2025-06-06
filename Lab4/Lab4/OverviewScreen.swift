//
//  OverviewScreen.swift
//  Lab4
//
//  Created by Yash Vipul Naik on 2025-06-06.
//

import SwiftUI

struct OverviewScreen: View {
    
    let quantity : String
    @State private var showCheckoutScreen : Bool = false

    var body: some View {
        let price : Double = (Double(quantity) ?? 0) * 5

        NavigationStack{
            Form{
                Section("Overview"){
                    Text("Total Quantity")
                    Text(quantity)
                }//section
                
                Section{
                    Text("Total Price")
                    Text(String(price))
                }//section
                
                Section{
                    Button{
                        self.showCheckoutScreen = true
                    } label: {
                        Text("Checkout")
                    }
                }//section
            }//form
            .navigationDestination(isPresented: $showCheckoutScreen){
                CheckoutScreen(price: price)
            }
        }//navigation
        .navigationTitle("Overview")
    }
}

#Preview {
    OverviewScreen(quantity: "0")
}
