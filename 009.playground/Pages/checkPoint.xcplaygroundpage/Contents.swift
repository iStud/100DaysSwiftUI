
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result1 = luckyNumbers.filter { number in
    !number.isMultiple(of:2)
}

let result2 = result1.sorted {
    $0<$1
}

let result3 = result2.map {
   "\($0) is a lucky number"
}

for s in result3{
    print(s)
}

