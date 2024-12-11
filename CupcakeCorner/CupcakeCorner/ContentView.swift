//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 7/12/24.
//

import SwiftUI


struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of Cakers \(order.quantity)", value: $order.quantity, in: 3...20)
                    
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.speciaRequest.animation())
                    
                    if order.speciaRequest {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section{
                    NavigationLink("Delivery details", destination: AddressView(order: order))
                }
                
            }.navigationTitle("Cupcake Corner")
        }
        
    }
}


#Preview {
    ContentView()
}
