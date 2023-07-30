//
//  ContentView.swift
//  CustomViewModifier
//
//  Created by bk.xiong on 2023/7/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Color.red
            .frame(width: 200,height: 200)
            .myView(with: "TTT")
    }
}


struct MyView: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment:.center) {
            content
            Text(text)
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
    }
}

extension View{
    func myView(with text:String) -> some View {
        modifier(MyView(text: text))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
