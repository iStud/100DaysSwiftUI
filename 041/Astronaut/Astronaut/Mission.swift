//
//  Mission.swift
//  Astronaut
//
//  Created by xbk on 2023/8/17.
//

import Foundation

//"crew": [
//    {
//        "name": "grissom",
//        "role": "Command Pilot"
//    }

struct CrewRole:Codable {
    
    let name:String
    let role:String
}

struct Mission:Codable,Identifiable {
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate:String {
        
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
