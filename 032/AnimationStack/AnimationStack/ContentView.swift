//
//  ContentView.swift
//  AnimationStack
//
//  Created by bk.xiong on 2023/8/6.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    @State private var animationAmount = 0.0
    
    
    var body: some View {

        print(animationAmount)
        
        return VStack {
            
//            Stepper("Scale amount",value: $animationAmount.animation(
//                .easeInOut(duration: 1)
//                .repeatCount(3,autoreverses: true)
//            ),in: 1...10)
//            Spacer()
//
//            Button("Tap me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
            
            Button("Tap me") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
            
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
