//
//  ContentView.swift
//  ScrollingGrid
//
//  Created by xbk on 2023/8/17.
//

import SwiftUI

let layout = [
//    GridItem(.fixed(80)),
//    GridItem(.fixed(80)),
//    GridItem(.fixed(80))
    GridItem(.adaptive(minimum: 80,maximum: 120))
]

struct ContentView: View {
    var body: some View {

        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
