

struct Employee {
    
    // computed property
    let name:String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    // stored property
    var vacationRemaining:Int{
       
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
        
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "ss", vacationAllocated: 15)
archer.vacationTaken += 4
archer.vacationRemaining = 5;
print(archer.vacationAllocated)
