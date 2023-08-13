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

struct SecondView:View {
    
    @Environment(\.dismiss) var dismiss
    
    let name:String
    var body: some View{
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
    
    @StateObject var user = User()
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("FirstName", text: $user.firstName)
            TextField("LastName", text: $user.lastName)
            
            Button("Show sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "@twostraws!")
            }
            
        }
        .padding()

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
