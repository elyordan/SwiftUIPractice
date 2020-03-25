//
//  ContentView.swift
//  Slots App
//
//  Created by Yunior Lopez on 3/25/20.
//  Copyright © 2020 Yunior Lopez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "cherry", "star"]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var numbers = [0, 0, 0]
    @State private var credits = 1000
    private var betAmount = 10
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                //Title
                HStack {
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)
                    
                    Text("SwiftUI Slots Machine")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)
                    
                }.scaleEffect(1.6)
                
                Spacer()
                
                //Credits Counter
                Text("Credits:" + String(credits))
                    .bold()
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                //Cards
                HStack {
                    
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]],
                        background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]],
                        background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[2]],
                        background: $backgrounds[2])
                    
                    Spacer()
                }
                
                Spacer()
                
                //Spin Button
                Button(action: {
                    
                    //Set Backgrouds white
                    self.backgrounds[0] = Color.white
                    self.backgrounds[1] = Color.white
                    self.backgrounds[2] = Color.white
                    
                    /*we can use maps to use less code and be less repetitive
                        self.backgrounds = self.backgrounds.map {_ in
                                Color.white
                     }*/
                    
                    
                    //Random Numbers
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    /*we can use maps to use less code and be less repetitive
                        self.numbers = self.numbers.map {_ in
                            Int.random(in: 0...self.symbols.count - 1)
                     }*/
                    
                    //Check Winnings
                    
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                    
                    //won
                        self.credits += self.betAmount * 10
                        
                        //Set Backgrouds green
                        self.backgrounds[0] = Color.green
                        self.backgrounds[1] = Color.green
                        self.backgrounds[2] = Color.green

                        /*we can use maps to use less code and be less repetitive
                            self.backgrounds = self.backgrounds.map {_ in
                                    Color.green
                         }*/
                    }
                    
                    else {
                    
                    //lost
                    self.credits -= self.betAmount
                        
                    }
                    
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.red)
                        .cornerRadius(20)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
