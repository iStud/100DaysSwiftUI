
//a didSet observer to run when the property just changed,
//and a willSet observer to run before the property changed.

struct App {
    
    var contacts = [String](){
        
        willSet{
            print("cuuret value \(contacts)")
            print("new value \(newValue)")
        }
        
        didSet {
            
            print("there are now \(contacts.count) contacts")
            print("old value was \(oldValue)")
        }
        
    }
}

//  Regardless of which you choose, please try to avoid putting too much work into property observers

var app = App()
app.contacts.append("A")
print("--------")
app.contacts.append("B")



