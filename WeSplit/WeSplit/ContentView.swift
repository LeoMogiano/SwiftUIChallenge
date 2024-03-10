//
//  ContentView.swift
//  WeSplit
//
//  Created by Leo Mogiano on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAumount = 0.0 // Apple recommends use State with private
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    // name binding state allows read and write the value $checkAmount
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAumount / 100 * tipSelection
        let grandTotal = checkAumount + tipValue
        let amoutPerPerson = grandTotal / peopleCount
        return amoutPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Monto", value: $checkAumount, format: .currency(code:Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        
                    Picker("Numero de personas", selection: $numberOfPeople) {
                        ForEach(2..<11) {
                            Text("\($0) personas")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("¿Cuanto quieres dar de propina?") {
                    Picker("Porcentajes de Propina",selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent
                            )
                        }
                    }.pickerStyle(.segmented)
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }.navigationTitle("PropinaGenerator")
        }
        
    }
    
}


#Preview {
    ContentView()
}
