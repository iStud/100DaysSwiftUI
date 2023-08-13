//
//  ContentView.swift
//  iExpense
//
//  Created by bk.xiong on 2023/8/13.
//

import SwiftUI

class User:ObservableObject{
    
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("FirstName", text: $user.firstName)
            TextField("LastName", text: $user.lastName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
