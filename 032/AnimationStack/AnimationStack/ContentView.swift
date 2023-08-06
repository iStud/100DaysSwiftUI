//
//  ContentView.swift
//  AnimationStack
//
//  Created by bk.xiong on 2023/8/6.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    
    var body: some View {

        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200,height: 200)
        .background(enabled ? .blue : .yellow)
        .animation(nil, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
