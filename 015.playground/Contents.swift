import Cocoa


// If you don’t want to pass a parameter’s name when calling a function, place an underscore before it:

func isUppercase(_ string:String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO WORLD"
let result = isUppercase(string)

/*
 struct
    - memberwise initializer
    - mutating
    - computed property
    - getter and setter
    - property observers
    - custom initializers
    - access control
    - static properties and methods
 
 class
    - inheriting
    - initializers
    - super
    - copy
    - deinit
 
 
 */
