//: [Previous](@previous)

import Foundation

protocol Person {
    var name:String {get}
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi I'm \(name)")
    }
}

struct Employee:Person{
    let name:String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

