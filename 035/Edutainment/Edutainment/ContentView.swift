//
//  ContentView.swift
//  Edutainment
//
//  Created by xbk on 2023/8/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var  x = 2;
    @State private var  y = 12;
    let times = [5, 10, 20]
    @State private var defaultTime = 5
    @State private var currentTime = 1
    
    private var a:Int {
        Int.random(in: x...y)
    }
    private var b:Int {
        Int.random(in: x...y)
    }
    
    private var value:Int{
       return a*b
    }
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                Form {
                    Section {
                        Stepper("\(x)", value:$x,in:2...12)
                        Stepper("\(y)", value:$y,in:2...12)
                    }header: {
                        Text("multiplication tables")
                    }
                    
                    Section {
                        Picker("Select practice times", selection: $defaultTime) {
                            ForEach(times,id:\.self) {
                                Text("\($0)")
                            }
                        }
                    }header: {
                        Text("practice times")
                    }
                    
                    Button("Start") {
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                
                Form {
                    Section{
                        Text("Progress rate:\(currentTime)/20")
                    }
                    
                    Section{
                        Text("\(a)*\(b)")
                    }
                
                    Section{
                        
                    
                        Text("\(value)")
                        Text("")
                        Text("")
                        Text("")
                    }

                }
                
            }
            .navigationTitle("Edutainment")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
