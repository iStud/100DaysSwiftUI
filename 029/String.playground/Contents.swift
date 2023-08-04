import Cocoa

let input = "a b c"
let letters = input.components(separatedBy: " ")

let a = """
a
b
c
"""
let n = a.components(separatedBy: "\n")

print(n)

let b = n.randomElement()
print(b)
