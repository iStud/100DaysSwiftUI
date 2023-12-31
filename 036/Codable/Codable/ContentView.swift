//
//  ContentView.swift
//  Codable
//
//  Created by xbk on 2023/8/14.
//

import SwiftUI

struct User:Codable {
    let firstName:String
    let lastName :String
}

struct ContentView: View {
    
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
