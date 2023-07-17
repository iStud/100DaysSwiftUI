import Cocoa

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser
greetCopy()

let team = ["Gloria","Suzanne","Piper","Tiffany","Tasha"]

let captainFirstTeam = team.sorted(by: {(name1:String,name2:String) -> Bool in
    
    if name1 == "Suzanne"{
        return true
    }else if name2 == "Suzanne"{
        return false
    }
    return name1 < name2
})

// in is used to mark the end of the parameters and return type

let tOnly = team.filter{$0.hasPrefix("T")}
print(tOnly)


func makeArr(size:Int,using generator:()->Int) -> [Int]{
    
    var numbers = [Int]()
    for _ in 0..<size{
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

let rolls = makeArr(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)


func doImportWork(first:()->Void,second:()->Void,third:()->Void) {
    
    print("first")
    first()
    print("second")
    second()
    print("third")
    third()
    print("Done")
}

doImportWork {
    print(1)
} second: {
    print(2)
} third: {
    print(3)
}

