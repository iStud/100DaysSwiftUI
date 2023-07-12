import Cocoa

var beatles = ["John","Paul","George","Ringo"]
let numbers = [4,8,15,16,23,42]
let temparetures = [25.3,28.2,26.4]

print(beatles[0])
print(numbers[1])
print(temparetures[2])

beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Novall")
beatles.append("VIvian")

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")


var anotherAlbums = [String]()
anotherAlbums.append("f")
anotherAlbums.append("L")
anotherAlbums.append("R")

print(anotherAlbums)
print(anotherAlbums.count)


var characters = ["Lana","Pam","Ray","Sterling"]
print(characters.count)
characters.remove(at: 2)
print(characters.count)
characters.removeAll()
print(characters.count)

let cities = ["London","Tokyo","Rome","Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)
