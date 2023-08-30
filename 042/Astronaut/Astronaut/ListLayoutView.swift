//
//  ListLayoutView.swift
//  Astronaut
//
//  Created by xbk on 2023/8/30.
//

import SwiftUI

struct ListLayoutView: View {
    
    let astronauts :[String:Astronaut]
    
    let missions:[Mission]
    
    
    var body: some View {
        
        ScrollView {

            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()

                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                )
            }
            
        }
    }
}

struct ListLayoutView_Previews: PreviewProvider {
    
    static let astronauts :[String:Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions:[Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayoutView(astronauts: astronauts, missions: missions)
    }
}
