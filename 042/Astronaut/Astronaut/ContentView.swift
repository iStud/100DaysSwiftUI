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
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State var showLayout:Bool = true
    
    var body: some View {
        
        NavigationView {
            
            Group {
                
                if showLayout {
                    CridLayoutView(astronauts: astronauts, missions: missions)
                }else {
                   ListLayoutView(astronauts: astronauts, missions: missions)
                }
                
            }
            .toolbar {
                Button {
                    showLayout.toggle()
                    
                } label: {
                    Text("ChangeLayout")
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
