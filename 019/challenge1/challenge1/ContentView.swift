//
//  ContentView.swift
//  challenge1
//
//  Created by xbk on 2023/7/26.
//

import SwiftUI

struct ContentView: View {
    
    let lengths:[String:Double]
    let types:[String]
    
    init() {
        self.lengths = ["meters":1.0,"kilometers":1000.0,"feet":0.3048,"yards":0.9144,"miles":1609.344]
        self.types = [String](lengths.keys)
    }
    
    // 1m 1000m 0.30m 0.91m 1609.34 m
    @State private var type = "meters"
    @State private var convertType = "kilometers"
    @State private var inputValue = 10.0
    @FocusState private var amountIsFocused: Bool
    
    var convertValue:String{
        
        let typleValue = Double(lengths[type]!)
        let convertValue = Double(lengths[convertType]!)
        print("\(inputValue) \(typleValue) \(convertValue)")
        return String(format: "%.2f",inputValue * typleValue / convertValue)
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Double", value: $inputValue, format:.number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("type", selection: $type) {
                        
                        ForEach(self.types,id:\.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Convert type", selection: $convertType) {
                        
                        ForEach(self.types,id:\.self) {
                            Text($0)
                        }
                    }
                    
                }header: {
                    Text("Input")
                }
                
                Section{

                    Text(convertValue)
                }header: {
                    Text("OutPut")
                }
            }
            .navigationTitle("Length conversion")
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
