//
//  ContentView.swift
//  WeSplit
//
//  Created by Leo Mogiano on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAumount = 0.0 // Apple recommends use State with private
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    // name binding state allows read and write the value $checkAmount
//    let tipPercentages = [10, 15, 20, 25, 0]
//    let tipPercentages = Array(1..<101)
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAumount / 100 * tipSelection
        let grandTotal = checkAumount + tipValue
        let amoutPerPerson = grandTotal / peopleCount
        return amoutPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAumount / 100 * tipSelection
        return checkAumount + tipValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Monto", value: $checkAumount, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        
                    Picker("Numero de personas", selection: $numberOfPeople) {
                        ForEach(2..<11) {
                            Text("\($0) personas")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("¿Cuanto quieres dar de propina?") {
                    Picker("Porcentajes de Propina",selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent
                            )
                        }
                    }.pickerStyle(.automatic)
                }
                Section("Monto por Persona") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Monto total") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "S"))
                }
                
            }.navigationTitle("PropinaGenerator")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
        }
        
    }
    
}


#Preview {
    ContentView()
}
