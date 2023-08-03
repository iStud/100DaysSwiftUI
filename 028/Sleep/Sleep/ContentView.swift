//
//  ContentView.swift
//  Sleep
//
//  Created by xbk on 2023/8/2.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    static var defaultWakeTime:Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    
    var sleepTime:String {
        
        var time = ""
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour+minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            time = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch  {
            
            time = "Sorry there was a problem calculating your bedtime."
        }
        
        return time
    }
    
    
    
    
    var body: some View {
        NavigationView{
            Form {
            
                Section {
                    DatePicker("Please enter a time",selection: $wakeUp,displayedComponents: .hourAndMinute)
                }header: {
                    Text("When do you want to wake up")
                }

                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount,in: 4...12,step: 0.25)
                }header: {
                    Text("Desired amount of sleep")
                }
                
                Section {
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1...20,id:\.self) {
                            Text("\($0)")
                        }
                    }
                }header: {
                    Text("Daily coffee intake")
                }
                
                Section{
                    Text(sleepTime)
                }header: {
                    Text("Your ideal bedtime is...")
                }
                
            }
            .navigationTitle("BetterRest")
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
