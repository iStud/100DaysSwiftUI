import Cocoa

var roll = 0
while roll != 20 {
    
    roll = Int.random(in: 1...20)
    print("I row a \(roll)")
}
print("Critical hit")
