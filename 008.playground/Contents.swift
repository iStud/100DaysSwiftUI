import Cocoa

enum NumberError:Error {
    case outOfBounds
}

func mySqrt(number:Int) throws -> Int {
    
    if(number > 10000 || number < 0){
        throw NumberError.outOfBounds
    }
    
    for i in 1...number {
        if(i*i <= number && (i+1)*(i+1)>number){
            return i
        }
    }
    return 0
}




do {
    let result = try mySqrt(number:14)
    print("\(result)")
}catch{
    print("out of Bounds")
}


