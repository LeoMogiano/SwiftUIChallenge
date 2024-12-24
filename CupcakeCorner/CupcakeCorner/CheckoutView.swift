//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Leo Mogiano on 15/12/24.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    @Environment(NavigatorManager.self) private var navigator
    
    @State private var isLoading = false
    
    @State private var titleMessage: String = ""
    @State private var showingAlert = false
    @State private var descriptionMessage: String = ""
    
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

                Button {
                    Task {
                        await placeOrder()
                    }
                } label: {
                    HStack {
                        Image(systemName: "cart.fill")
                        Text("Place Order")
                            .fontWeight(.bold)
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
                .scaleEffect(1.1)
                

            }
        }.navigationTitle(Text("Check out"))
            .navigationBarTitleDisplayMode(.inline)
            .scrollClipDisabled()
            .scrollBounceBehavior(.basedOnSize)
            .alert(titleMessage, isPresented: $showingAlert) {
                Button("OK") {
                    
                }
            } message: {
                Text(descriptionMessage)
            }
 
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            titleMessage = "Order placed!"
            descriptionMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingAlert = true
            
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
            titleMessage = "Error!"
            descriptionMessage = "Checkout failed: \(error.localizedDescription)"
            showingAlert = true
        }
        
    }
}

#Preview {
    @Previewable @State var navigator = NavigatorManager()
    CheckoutView(order: Order())
        .environment(navigator)
}
