
// continue skips the current loop iteration, and break skips all remaining iterations.

let fileNames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
for fileName in fileNames{
    if fileName.hasSuffix(".jpg") == false{
        continue
    }
    print("fount picture \(fileName)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100000{
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
        
}
print(multiples)

