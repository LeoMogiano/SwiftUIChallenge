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
    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 1
    
    @State private var alerTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
 
    var body: some View {
        //        VStack {
        //            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25 ).padding(.horizontal, 80)
        //            DatePicker("Please enter a date", selection: $wakeUp,in: Date.now..., displayedComponents: .date).labelsHidden()
        //            Spacer().frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        //            Text(wakeUp, format: .dateTime.day().month().year())
        //            Text(Date.now.formatted(date: .long, time: .shortened))
        //        }
        //        .padding()
        NavigationStack {
            VStack (spacing:15){
                Spacer().frame(height: 60)
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Spacer().frame(height: 7)
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.5)
                    .padding(.horizontal, 100)
                Spacer().frame(height: 7)
                Text("Daily coffe intake")
                    .font(.headline)
                Stepper("\(coffeeAmount.formatted()) cups", value: $coffeeAmount, in: 1...20)
                    .padding(.horizontal, 100)
                Spacer()
                
            }
            .navigationTitle("BetterRest Quiz")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alerTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }

        }
    
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64((hour + minutes)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alerTitle = "Your ideal bed time is..."
            alertMessage = "\(sleepTime.formatted(date:.omitted, time: .shortened))"
        } catch {
            alerTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bed time."
        }
        
        showingAlert = true
    }
    
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
