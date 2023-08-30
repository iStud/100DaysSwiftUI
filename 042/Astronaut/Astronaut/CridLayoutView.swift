//
//  CridLayoutView.swift
//  Astronaut
//
//  Created by xbk on 2023/8/30.
//

import SwiftUI

struct CridLayoutView: View {
   
    var astronauts :[String:Astronaut]
    var missions:[Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    
    var body: some View {

        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
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
                            .background(.lightBackground)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
            .padding([.horizontal, .bottom])
        }

    }
}

struct CridLayoutView_Previews: PreviewProvider {
    
   static let astronauts :[String:Astronaut] = Bundle.main.decode("astronauts.json")
   static let missions:[Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        CridLayoutView(astronauts:astronauts , missions: missions)
    }
}
