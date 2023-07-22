import Cocoa



var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

print(trimmed)
print(quote)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var lines:[String] {
        self.components(separatedBy: .newlines)
    }
}

let trimmed2 = quote.trimmed()
print(trimmed2)


// this kind of function is called a global function, because it’s available everywhere in our project.
func trim(_ string:String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed3 = trim(quote)
print(trimmed3)


// if you’re returning a new value rather than changing it in place, you should use word endings like ed or ing, like reversed().

// // You can also use extensions to add properties to types, but there is one rule: they must only be computed properties, not stored properties.


let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)
print(quote.lines.count)

struct Book {
    let title: String
    let pageCount :Int
    let readingHours :Int
}

extension Book {
    init(title:String,pageCount:Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

// have the default memberwise initializer as well as our custom initializer, we’d place the custom one in an extension

let book = Book.init(title: "aaa", pageCount: 12, readingHours: 1)
let book1 = Book.init(title: "bbb", pageCount: 3)
