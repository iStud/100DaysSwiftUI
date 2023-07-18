import Cocoa

struct Album {
    let title:String
    let artist:String
    let year:Int
    
    func printSummary() {
        
        print("\(title) \(year) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
red.printSummary()
print(red.title)

struct Employee {
    let name: String
    var vacationRemaining: Int
    
    // any functions that only read data are fine as they are, but any that change data belonging to the struct must be marked with a special mutating keyword
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)



