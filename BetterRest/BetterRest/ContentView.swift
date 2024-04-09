//
//  ContentView.swift
//  BetterRest
//
//  Created by Leo Mogiano on 4/4/24.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeUp
    @State private var coffeeAmount = 1
    
    @State private var alerTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeUp: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var bedTime: Date {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64((hour + minutes)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime
            
//            alerTitle = "Your ideal bed time is..."
//            alertMessage = "\(sleepTime.formatted(date:.omitted, time: .shortened))"
        } catch {
            alerTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bed time."
            return Date.now
        }
        
        
    }
 
    var body: some View {

        NavigationStack {
          
            Form {
                Section (header: Text("When do you want to wake up ?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding(.horizontal,120)
                }
                
                Section (header: Text("Desired amount of sleep") ) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.5)
                }
                Section (header: Text("Daily coffe intake") ) {
//                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    Picker("Cups of coffee", selection: $coffeeAmount) {
                        ForEach(0..<11) {
                            Text($0, format: .number)
                                
                        }
                    }
                }
                
                Text((bedTime.formatted(date: .omitted, time: .shortened)))
                    .padding(.horizontal, 130)
                
                
            }
            .navigationTitle("BetterRest Quiz")
//            .toolbar {
//                Button("Calculate", action: calculateBedTime)
//            }
//            .alert(alerTitle, isPresented: $showingAlert) {
//                Button("OK") { }
//            } message: {
//                Text(alertMessage)
//            }
            
            
        }
        
    }
    
//    func calculateBedTime() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//            
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minutes = (components.minute ?? 0) * 60
//            
//            let prediction = try model.prediction(wake: Int64((hour + minutes)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
//            
//            let sleepTime = wakeUp - prediction.actualSleep
//            
//            alerTitle = "Your ideal bed time is..."
//            alertMessage = "\(sleepTime.formatted(date:.omitted, time: .shortened))"
//        } catch {
//            alerTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bed time."
//        }
//        
//        showingAlert = true
//    }
    
//    func exampleDates() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let _date = Calendar.current.date(from: components)
//    }
}

#Preview {
    ContentView()
}
