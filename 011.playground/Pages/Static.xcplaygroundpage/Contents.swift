import Cocoa

// you want to add a property or method to the struct itself, rather than to one particular instance of the struct, which allows you to use them directly.

struct School {
    static var studentCount = 0
    
    static func add(student:String) {
        
        print("\(student) joined the school")
        studentCount += 1;
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

//  self refers to the current value of the struct, and Self refers to the current type.
// First, I use static properties to organize common data in my apps.

struct AppData {
    
    static let version = ""
    static let saveFilename = ""
    static let homeURL = ""
}

struct Employee {
    let username:String
    let password:String
    
    static let example = Employee(username: "cfederighi", password: "hairforceone")
    
}


