//: [Previous](@previous)

import Foundation

func randomValue(arr:[Int]?) -> Int {
    arr?.randomElement() ?? Int.random(in: 1...100)
}

let result = randomValue(arr:nil)
