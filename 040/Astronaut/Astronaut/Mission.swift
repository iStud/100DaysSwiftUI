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
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
