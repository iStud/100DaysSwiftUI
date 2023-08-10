//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by xbk on 2023/7/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var count = 0;
    @State private var showCount = false
    @State private var animationAmount = 0.0
    @State private var animationOpacity = 1.0
    
    var body: some View {
        
        ZStack{
            
            RadialGradient(stops: [
                .init(color:Color(red: 0.1, green: 0.2, blue: 0.45),location: 0.3),
                .init(color:Color(red: 0.76, green: 0.15, blue: 0.26),location: 0.3)], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing:15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number, buttonName:countries[number])
                        } label: {

                            Image(countries[number]).FlagImage()
                        }
                        .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount:0), axis: (x: 0, y: 1, z: 0))
                        .opacity(number == correctAnswer ? 1:animationOpacity)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score:\(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        }message: {
            Text("Your score is \(score)")
        }
        
        .alert("Only 8 questions once", isPresented: $showCount) {
            
            Button("No", role:.cancel) { }
            Button("Yes") {
                count = 0
                showCount = false
                score = 0
            }
            
        }message: {
            Text("Do you want to reset")
        }
    }
    
    func flagTapped(_ number:Int,buttonName:String) {
        
        withAnimation {
            animationOpacity = 0.25
        }
        
        
        count += 1
        if count > 8 {
            showCount = true
            return
        }
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
            withAnimation {
                animationAmount += 360
            }
            
        }else{
            scoreTitle = "Wrong! That’s the flag of \(buttonName)"
            score -= 1
            score = score < 0 ? 0:score
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        animationOpacity = 1.0
    }
    
}

// https://stackoverflow.com/questions/62677059/swiftui-cant-directly-called-modifier-when-custom-image-modifier
extension Image {
    
    func FlagImage() -> some View {
        self
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
