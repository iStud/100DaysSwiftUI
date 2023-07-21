
class Animal {
    var legs:Int
    init(legs:Int) {
        self.legs = legs
    }
}

class Dog:Animal {
    func speak() {
        print("dog speak")
    }
}

class Cat:Animal {
    
    var isTame:Bool
    
    init(legs:Int,isTame:Bool){
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        
        print("cat speak")
    }
    
}
class Corgi:Dog {
    
    override func speak() {
        print("Corgi sepeak")
    }
}

class Poodle:Dog {
    
    override func speak() {
        print("Poodle speak")
    }
}

class Persian:Cat {
    
    override func speak() {
        print("Persian speak")
    }
}

class Lion:Cat {
    override func speak() {
        print("Lion speak")
    }
}

let cat = Cat(legs: 4, isTame: true)
cat.speak()
print("\(cat.legs) \(cat.isTame)")


