//
//  ContentView.swift
//  WordScramble
//
//  Created by xbk on 2023/8/3.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn","Leia","Luke","Rey"]
    
    var body: some View {
        
//        List(people,id: \.self){
//            Text($0)
//        }
        
        List {
            Text("Static Row")

            ForEach(people, id: \.self) {
                Text($0)
            }

            Text("Static Row")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
