import Cocoa

var username:String? = nil


if let unwrappedName = username {
    print("\(unwrappedName)")
}else{
    print("empty")
}

func square(number:Int) -> Int {
    number * number
}

var number:Int? = nil

if let number = number{
    print(square(number: number))
}else{
    print("empty")
}



