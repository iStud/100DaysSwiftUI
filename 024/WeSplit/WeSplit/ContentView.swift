//
//  ContentView.swift
//  WeSplit
//
//  Created by bk.xiong on 2023/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    let tipPercentages = [10,15,20,25,0]
    var totalPerPerson:[Double] {
        
        let peopleCount = Double(numberOfPeople+2)
        let tipSection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return [amountPerPerson,grandTotal]
    }
    
    let localCurrency:FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    

    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        .foregroundColor(tipPercentage == 0 ? .red:.black)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                   
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
//                    .pickerStyle(.segmented)
                }header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{

                    Text(totalPerPerson[0], format:localCurrency)
                }header: {
                    Text("Total Amount")
                }
                
                Section {
                    Text(totalPerPerson[1], format:localCurrency)
                    
                }header: {
                    Text("Amount per person")
                }
                

            }
            .navigationTitle("WeSplit")
            .toolbar {
                
                ToolbarItemGroup(placement: .keyboard) {
                    
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
