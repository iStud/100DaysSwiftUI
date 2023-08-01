//
//  ContentView.swift
//  BetterRest
//
//  Created by bk.xiong on 2023/8/1.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    let now = Date.now
    let tomorrow = Date.now.addingTimeInterval(86400)
    


    var body: some View {
        VStack {
            
            Stepper("\(sleepAmount) hours", value: $sleepAmount,in: 4...12,step: 0.25)
            DatePicker("Please enter a date", selection: $wakeUp,displayedComponents: .hourAndMinute)
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            Text("\(now)")
            Text("\(tomorrow)")
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
            
            
        }
        .padding()
        .onAppear(){
            test()
        }
    }

}

func test() {
    
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? Date.now
    print("--")

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
