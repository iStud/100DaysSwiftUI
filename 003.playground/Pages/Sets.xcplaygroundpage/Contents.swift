import Cocoa

//set: you can’t add duplicate items, and they don’t store their items in a particular order.
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people )

var person = Set<String>()
person.insert("D")
person.insert("T")
person.insert("N")
person.insert("S")
print(person)
