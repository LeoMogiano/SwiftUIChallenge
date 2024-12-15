//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 15/12/24.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    var body: some View {
        ScrollView{
            VStack{
                ImageView(
                    url:"https://hws.dev/img/cupcakes@3x.jpg",
                    frameWidth: .infinity,
                    frameHeight: 230
                )
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                            .font(.title)

                Button("Place Order", action: { })
                            .padding()
            }
        }.navigationTitle(Text("Check out"))
            .navigationBarTitleDisplayMode(.inline)
            .scrollClipDisabled()
            .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    CheckoutView(order: Order())
}
