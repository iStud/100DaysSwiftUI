//: [Previous](@previous)

import Foundation


var myVar:Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}


func printSquare(of number:Int?){
    guard let number = number else {
        print("missing")
        return
    }
    
    print("\(number * number)")
}


