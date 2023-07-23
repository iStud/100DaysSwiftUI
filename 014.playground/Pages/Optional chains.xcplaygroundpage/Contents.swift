//: [Previous](@previous)

import Foundation

struct Book {
    let title: String
    let author: String?
}


// Optional chains can go as long as you want, and as soon as any part sends back nil the rest of the line of code is ignored and sends back nil.
var book:Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

let credentials = ["twostraws", "fr0sties"]
credentials.first?.lowercased()
