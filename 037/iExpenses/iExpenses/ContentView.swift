//
//  ContentView.swift
//  iExpenses
//
//  Created by xbk on 2023/8/14.
//

import SwiftUI

struct ExpenseItem :Identifiable,Codable{
    var id = UUID()
    let name:String
    let type:String
    let amount:Double
}

class Expense: ObservableObject {
    
    @Published var items = [ExpenseItem](){
        didSet {
            
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded,forKey:"Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}




struct ContentView: View {
    
    @StateObject var expenses = Expense()
    @State private var showingAddExpense = false
    
    var body: some View {
        
        NavigationView{
            List {
                
                Section{
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundColor(setColor(amount: item.amount))
                            }
                        }
                    }
                    .onDelete(perform: removeItems(at:))
                }header: {
                    Text("Personal")
                }
                
                
                Section{
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundColor(setColor(amount: item.amount))
                            }
                        }
                    }
                    .onDelete(perform: removeItems(at:))
                }header: {
                    Text("Bussiness")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets:IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func setColor(amount:Double) -> Color {
        
        var color = Color(.clear)
        if amount <= 10 {
            color = .blue
        }else if amount <= 100 {
            color = .yellow
        }else {
            color = .green
        }
        return color
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
