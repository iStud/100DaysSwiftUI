//: [Previous](@previous)

import Foundation

protocol Building {
    
    var rooms:Int {get}
    var cost:Int {get}
    var agent:String {get}
    
    func salesSummary()
    
}

struct House:Building{
    var rooms: Int
    
    var cost: Int
    
    var agent: String
    
    func salesSummary() {
        
        print("rooms:\(rooms),cost:\(cost),agent:\(agent)")
    }
    
}

extension House {
    
    init(rooms:Int,cost:Int) {
        
        self.rooms = rooms
        self.cost = cost
        self.agent = "qwe"
    }
}

let house1 = House(rooms: 1, cost: 2, agent:"3")
house1.salesSummary()

let house2 = House(rooms: 9, cost: 10)
house2.salesSummary()


