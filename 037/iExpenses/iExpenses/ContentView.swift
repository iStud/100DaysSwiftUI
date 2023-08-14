//
//  ContentView.swift
//  iExpenses
//
//  Created by xbk on 2023/8/14.
//

import SwiftUI

struct ExpenseItem {
    let name:String
    let type:String
    let amount:Double
}

class Expense: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @StateObject var expenses = Expense()
    
    var body: some View {
        
        NavigationView{
            List {
                ForEach(expenses.items,id:\.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems(at:))
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets:IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
