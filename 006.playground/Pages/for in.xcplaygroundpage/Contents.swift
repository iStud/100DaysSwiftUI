import Cocoa

for i in 1...5{
    print("\(i)")
}

for j in 1..<5{
    print("\(j)")
}

var lyrics = "Haters gonna"

// sometimes you want to run some code a certain number of times using a range, but you don’t actually want the loop variable – you don’t want the i or j, because you don’t use it.
for _ in 1...5 {
    lyrics += " hates"
}
print(lyrics)
