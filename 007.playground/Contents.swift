import Cocoa

var greeting = "Hello, playground"

func printTimesTables(number:Int,end:Int){
    print("\(number),\(end)")
}

printTimesTables(number: 10, end: 20)

// when a function has only one line of code, we can remove the return keyword entirely

// if your function doesn’t return a value, you can still use return by itself to force the function to exit early.


func pythagoras(a:Double,b:Double) -> Double {
    
    let input = a*a+b*b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)

// tuple
func getUser() ->(firstName:String,lastName:String) {
    
    (firstName:"Taylor",lastName:"Swift")
}

let user = getUser()
let firstName = user.firstName
let lastName = user.lastName

print("\(firstName),\(lastName)")


// Swift gives us two important ways to control parameter names: we can use _ for the external parameter name so that it doesn’t get used, or add a second name there so that we have both external and internal parameter names.

func isUppercase(_ string:String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO,WORLD"
let result = isUppercase(string)
