//
//  ContentView.swift
//  Scrollview
//
//  Created by bk.xiong on 2023/8/16.
//

import SwiftUI

struct CustomText:View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        
        print("Create a new customText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10){
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
                
            }
            .frame(maxWidth: .infinity)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
