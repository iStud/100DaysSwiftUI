//
//  ContentView.swift
//  challenge1
//
//  Created by xbk on 2023/7/26.
//

import SwiftUI

struct ContentView: View {
    
    let lengths:[String:Double] = ["meters":1.0,"kilometers":1000.0,"feet":0.3048,"yards":0.9144,"miles":1609.344]
    
    // 1m 1000m 0.30m 0.91m 1609.34 m
    @State private var type = "meters"
    @State private var convertType = "kilometers"
    @State private var inputValue = 10.0
    
    var convertValue:String{
        
        let typleValue = Double(lengths[type]!)
        let convertValue = Double(lengths[convertType]!)
        return String(format: "%.2f",inputValue * typleValue / convertValue)
    }
    
    var body: some View {
        Form{
            Section{
                TextField("Double", value: $inputValue, format:.number)
                Picker("type", selection: $type) {
                    let types = [String](lengths.keys)
                    ForEach(types,id:\.self) {
                        Text($0)
                    }
                }
            }header: {
                Text("Input")
            }
            
            Section{
                Picker("Convert type", selection: $convertType) {
                    let types = [String](lengths.keys)
                    ForEach(types,id:\.self) {
                        Text($0)
                    }
                }
                Text(convertValue)
            }header: {
                Text("Out Put")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
