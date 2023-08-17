//
//  ContentView.swift
//  Astronaut
//
//  Created by xbk on 2023/8/17.
//

import SwiftUI


struct ContentView: View {
    
    let astronauts :[String:Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions:[Mission] = Bundle.main.decode("missions.json")
    
    
    var body: some View {
        VStack{
            Text("\(astronauts.count)")
            Text("\(missions.count)")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
