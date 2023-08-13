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
    @State private var defaultCount = 5
    @State private var currentCount = 0
    @State private var a = 0
    @State private var b = 0
    @State private var answer = 0
    @State private var score = 0
    @State private var arr:[Int] = []

    

    var body: some View {
        NavigationView{
            
            ZStack{
                
                Form {
                    Section {
                        Stepper("\(x)", value:$x,in:2...12)
                        Stepper("\(y)", value:$y,in:2...12)
                    }header: {
                        Text("multiplication tables")
                    }
                    
                    Section {
                        Picker("Select practice times", selection: $defaultCount) {
                            ForEach(times,id:\.self) {
                                Text("\($0)")
                            }
                        }
                    }header: {
                        Text("practice times")
                    }
                    
                    Button("Start") {
                        startGame()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                
                Form {
                    Section{
                        Text("Progress rate:\(currentCount)/20")
                    }
                    
                    Section{

                        Text("\(a) * \(b)")
                    }
                
                    Section{
                        
                        ForEach(arr, id: \.self) { number in
                            
                            Button("\(number)") {
                                
                                if number == answer {
                                    score += 1
                                }
                                
                            }
                            .foregroundColor(.black)
                        }
                    }
                    
                    Section{
                        
                        Button("Next") {
                        
                            startGame()
                        }
                    }
                    
                    Section{
                        
                        Text("score: \(score)")
                    }

                }
                
            }
            .navigationTitle("Edutainment")
            
        }
    }
    
    func startGame() {
        
        if(currentCount >= defaultCount){
            return
        }
        
        a = Int.random(in: 1...x)
        b = Int.random(in: 1...y)
        answer = a * b
        arr = [answer,answer-1,answer+1,answer+2].shuffled()
        currentCount += 1

        
        print("\(a),\(b),\(arr)")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
