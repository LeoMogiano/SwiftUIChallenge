//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 11/12/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form{
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip Code", text: $order.zipCode)
            }
            Section {
                NavigationLink("Check Out", value: NavigationWrapper(value: order, identifier: "checkout"))
            }.disabled(order.hasValidAddress == false)
        }
    }
}

#Preview {
    AddressView(order: Order())
}
