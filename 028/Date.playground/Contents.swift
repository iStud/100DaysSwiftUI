import Cocoa
import SwiftUI


let now = Date.now
let tomorrow = Date.now.addingTimeInterval(86400)
let range = now...tomorrow

//DateComponents: read or write specific parts of a date rather than the whole thing
var components = DateComponents()
components.hour = 8
components.minute = 40
let date = Calendar.current.date(from: components)
//
//let com = Calendar.current.dateComponents([.hour, .minute], from: Date())
//let hour = components.hour ?? 0
//let minute = components.minute ?? 0
//
//Text(Date.now, format: .dateTime.hour().minute())

//let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
//let hour = (components.hour ?? 0) * 60 * 60
//let minute = (components.minute ?? 0) * 60
