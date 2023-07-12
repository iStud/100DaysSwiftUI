import Cocoa

let employee2 = [
    "name":"Taylor Swift",
    "job":"Singer",
    "location":"Nashville"
]
print(employee2["job",default: "Unknown"]) // a default value to use if the key doesn’t exist.

let hasGraduated = [
    "Eric":false,
    "Maeve":true,
    "Otis":false,
]

print(hasGraduated)

let olympics = [
    2012:"London",
    2016:"Rio de Janeiro",
    2021:"Tokyo"
]
print(olympics[2012,default: "Unkonwn"])

var heights = [String:Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206
print(heights)

