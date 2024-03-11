//
//  ContentView.swift
//  MogiClima
//
//  Created by Leo Mogiano on 11/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var initialValue = 0.0
    @State private var initialUnit = "ºC"
    @State private var finalUnit = "ºC"
    
    let temperatureUnits = ["ºC", "K", "ºF"]
    
    func converTemp(value: Double,from initialUnit: String, to finalUnit: String) ->Double {
        var initialValue = value
        
        switch initialUnit {
        case "K":
            initialValue = -273.15
            break
        case "ºF":
            initialValue = (initialValue - 32) * 5/9
            break
        default:
            break
        }
        
        switch finalUnit {
        case "K":
            initialValue += 273.15
            break
        case "ºF":
            initialValue = initialValue * 9/5 + 32
            break
        default:
            break
        }
        return initialValue
    }
    
    var finalValue: Double {
        
        return converTemp(value: initialValue, from: initialUnit, to: finalUnit)
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convertir De") {
                    HStack {
                        TextField("Temp. Inicial",value: $initialValue, format: .number )
                            .keyboardType(.decimalPad)
                        Picker("Unidad de Temperatura", selection: $initialUnit) {
                            ForEach(temperatureUnits, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.segmented)
                    }
                }
                Section("Convertir A") {
                    Picker("Unidad de Temperatura", selection: $finalUnit) {
                        ForEach(temperatureUnits, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                }
                Section("Conversión Final") {
                    Text("\(finalValue, specifier: "%.1f") \(finalUnit)")
                    
                }
            }.navigationTitle("TempConverter")
        }
    }
}

#Preview {
    ContentView()
}
