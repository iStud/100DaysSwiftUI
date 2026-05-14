//
//  ContentView.swift
//  SwiftUI-02
//
//  Created by bk.xiong on 2026/5/13.
//

import SwiftUI

struct ContentView: View {
    
    let food = Food.examples
    @State private  var selectedFood : Food?
    
    var body: some View {
        VStack(spacing: 30) {
            if(selectedFood != .none){
                Text(selectedFood!.image)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .frame(height: 250)
                    .border(.red)
                
            }else{
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
            }
            Text("今天吃什么？")
                .bold()
            
            if(selectedFood != .none){
                Text(selectedFood!.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            Button {
                // 从数组中随机选择一个与当前选项不同的食物 。
                selectedFood = food.shuffled().filter{$0 != selectedFood}.first
            } label: {
                Text(selectedFood == .none ? "告诉我":"换一个").frame(width: 200)
            }
            .padding(.bottom,-15)
            
            Button {
                selectedFood = .none
            } label: {
                Text("重置").frame(width: 200)
            }.buttonStyle(.bordered)
            
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut, value:selectedFood)
        
    }
}

#Preview {
    ContentView()
}
