//
//  ContentView.swift
//  UserDefaults
//
//  Created by xbk on 2023/8/14.
//

import SwiftUI

struct ContentView: View {

//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count:\(tapCount)") {
            tapCount += 1
//            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
