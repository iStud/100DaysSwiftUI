//
//  ContentView.swift
//  NavigationLink
//
//  Created by bk.xiong on 2023/8/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List(0..<100) { row in
                
                NavigationLink {
                    Text("Detail\(row)")
                }label: {
                    Text("Row \(row)")
                }
                
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
