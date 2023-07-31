//
//  ContentView.swift
//  Challenge
//
//  Created by bk.xiong on 2023/7/31.
//

import SwiftUI

struct ContentView: View {
    
    @State private var arr = ["✊", "✌️","✋"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var questions = 0;
    @State private var isHidden = false
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            
            Text("Rock Paper Scissors \(arr[correctAnswer])")
                .font(.largeTitle)
            
            ForEach(0..<3) { number in

                Button(arr[number]) {
                    btnClic(number)
                }
                .padding(20)
                .font(.system(size: 50))
            }
            
            if isHidden {
                Text("Score:\(score)")
                    .font(.largeTitle)
            }
     
        }
        
        .alert("Only can paly 10 times", isPresented: $showAlert) {
            
            Button("No") {
                isHidden = true
                print("\(isHidden)")
            }
            Button("Yes") {
                score = 0
                questions = 0
                isHidden = false
                correctAnswer = Int.random(in: 0...2)
                showAlert = false
            }
            
        }message: {
            
            Text("Do you want to reset")
        }

    }
    
    func btnClic(_ number:Int) {
        
        questions += 1
        if(questions>10){
            showAlert = true
            isHidden = true
            return
        }
        

        if number == correctAnswer {
            score += 1
        }else{
            score -= 1
            score = score < 0 ? 0 : score
        }
        correctAnswer = Int.random(in: 0...2)
        
        if questions == 10 {
            isHidden = true
            showAlert = true
        }


    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
