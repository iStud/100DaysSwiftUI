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
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView{
            VStack {
                
                Form{
                    
                    Section{
                        Text("Your name is \(user.firstName) \(user.lastName)")
                        TextField("FirstName", text: $user.firstName)
                        TextField("LastName", text: $user.lastName)
                    }header: {
                        Text("@StateObject")
                    }
                    
                    Section {
                        Button("Show sheet") {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                            SecondView(name: "@twostraws!")
                        }
                    }header: {
                        Text("Sheets")
                    }
                    
                    Section {
                        
                        List {
                            ForEach(numbers,id:\.self) {
                                Text("Row \($0)")
                            }
                            .onDelete(perform: removeRows)
                        }
                        
                        Button("Add Number") {
                            
                            numbers.append(currentNumber)
                            currentNumber += 1
                        }
                        
                    }header: {
                        Text("onDelete()")
                    }
                    
                }
                
            }
            .navigationTitle("Day 36")
            .toolbar {
                EditButton()
            }
            
        }
        
    }
    
    func removeRows(at offsets:IndexSet){
        numbers.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
