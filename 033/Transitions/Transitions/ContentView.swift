//
//  ContentView.swift
//  Transitions
//
//  Created by xbk on 2023/8/9.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me"){
                withAnimation {
                    
                    isShowingRed.toggle()
                }
            }
            if isShowingRed{
                Rectangle()
                    .fill(.red)
                    .frame(width: 200,height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
