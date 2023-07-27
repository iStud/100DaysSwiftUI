//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by xbk on 2023/7/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        Button("show alert"){
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete",role: .destructive){}
            Button("Cancel",role: .cancel){}
        }message: {
            Text("Please read this")
        }
    }
    
    func executeDelete(){
        print("Now delete....")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
