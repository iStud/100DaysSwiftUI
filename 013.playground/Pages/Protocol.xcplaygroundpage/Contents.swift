import Cocoa

// they let us define a series of properties and methods that we want to use. They don’t implement those properties and methods – they don’t actually put any code behind it – they just say that the properties and methods must exist, a bit like a blueprint.
// If you ever need to subclass something and conform to a protocol, you should put the parent class name first, then write your protocols afterwards.

protocol Vehicle {
    var name:String{
        get
    }
    var currentPassengers:Int{
        get
        set
    }
    func estimate(for distance:Int) -> Int
    func travel(distance:Int)
}

struct Car:Vehicle {
    
    let name = "Car"
    var currentPassengers = 1
    
    func estimate(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day")
    }
}

func commute(distance:Int,using vehicle:Vehicle) {
    
    if vehicle.estimate(for: distance) > 100 {
        print("too slow")
    }else{
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles:[Vehicle],distance:Int){
    
    for vehicle in vehicles {
        let estamate = vehicle.estimate(for: distance)
        print("\(vehicle.name):\(estamate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

struct Bicycle:Vehicle{

    let name = "Bicycle"
    var currentPassengers = 1
    
    func estimate(for distance: Int) -> Int {
        distance/10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)


getTravelEstimates(using: [car,bike], distance: 100)
