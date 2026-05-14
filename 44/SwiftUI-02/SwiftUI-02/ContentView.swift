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
    @State  var showInfo : Bool
    
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
                HStack(){
                    Text(selectedFood!.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.green)
                    Button{
                        showInfo.toggle()
                    }label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.secondary)
                    }.buttonStyle(.plain)
                }
                Text("热量\(selectedFood!.calorie.formatted())大卡")

            }
            if showInfo{
                Grid(horizontalSpacing: 12,verticalSpacing: 12){
                    GridRow() {
                        Text("蛋白质")
                        Text("脂肪")
                        Text("碳水")
                    }.frame(minWidth: 60)
                    
                    GridRow() {
                        Text("123")
                        Text("123")
                        Text("123")
                    }
                }
                .font(.title3)
                .padding(.horizontal)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(.systemBackground)))
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
    ContentView(showInfo: false)
}
