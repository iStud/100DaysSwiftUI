//
//  ContentView.swift
//  Edutainment
//
//  Created by xbk on 2023/8/10.
//

import SwiftUI

struct ContentView: View {
    
    let times = [5, 10, 20]
    @State private var  x = 2;
    @State private var  y = 12;
    @State private var defaultTime = 5
    @State private var currentTime = 1
    @State private var a = 0
    @State private var b = 0
    @State private var answer = 0


    

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
                        
                        a = Int.random(in: 1...x)
                        b = Int.random(in: 1...y)
                        answer = a * b
                        print("\(a),\(b)")
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                
                Form {
                    Section{
                        Text("Progress rate:\(currentTime)/20")
                    }
                    
                    Section{

                        Text("\(a) * \(b)")
                    }
                
                    Section{
                        
                        
                        Text("\(answer)")
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
