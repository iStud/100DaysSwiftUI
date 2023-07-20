

struct Car {
    let model:String
    let sets:Int
    
    // private(set). This means “let anyone read this property, but only let my methods write it
    private(set) var currentGear = 1 {
        didSet{
            print("currentGear \(currentGear)")
        }
    }
    
    mutating func shiftUp() {
        if currentGear+1 > 10 {
            print("top")
        }else{
            currentGear += 1
        }
        
    }

    mutating func shiftDown() {
        if currentGear-1<1{
            print("low")
        }else{
            currentGear -= 1
        }
    }
}


var car = Car(model: "BMW", sets: 4)
car.shiftUp()
car.shiftUp()
car.shiftUp()
car.shiftUp()
car.shiftDown()
