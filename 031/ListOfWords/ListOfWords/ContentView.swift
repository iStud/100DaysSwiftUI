//
//  ContentView.swift
//  ListOfWords
//
//  Created by xbk on 2023/8/4.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = "a b c"
    @State private var newWord = ""
    @State private var score = 0
    let placeHolder = "Enter your word"
    
    var letters:[String]{
        rootWord.components(separatedBy: " ")
    }
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    TextField(placeHolder,text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section{
                    Text("\(score)")
                }header: {
                    Text("score")
                }
                Section{
                    ForEach(usedWords,id: \.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
                
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .toolbar {
                Button("Restart") {
                    startGame()
                }
            }
        }
    }
    
    
    func addNewWord()  {
        
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 3 && answer != placeHolder.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        calculateScore(answer: answer)
        
        newWord = ""
    }
    
    func startGame() {
        newWord = ""
        score = 0
    }
    
    func calculateScore(answer:String){
        
        let letter = letters.randomElement() ?? "a"
        if answer.contains(letter){
            score += 1
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
