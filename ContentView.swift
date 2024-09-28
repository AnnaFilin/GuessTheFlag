//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Anna Filin on 25/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var askedQuestions = 1
//    let totalQuestions = 8
    @State private var isAccomplished = false
    
//    var isAccomplished: Bool {
//        if askedQuestions < totalQuestions {
//                return false
//            } else {
//                return true
//            }
//        }
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert("Your final score is \(score)", isPresented: $isAccomplished){
            Button("Reset", action: reset)
        } message: {
            Text("Your final score is \(score)")
            Text("Game Over!")
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
    }
    
    func flagTapped(_ number: Int) {
     
            if(number == correctAnswer) {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong! That's the flag of \(countries[number])"
               
            }
       
       
        showingScore = true
        }
    
    
    func askQuestion() {
        if(askedQuestions < 3) {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            askedQuestions += 1
        }
        else {
            isAccomplished = true
        }
    }
    
    func reset() {
        score = 0
        askedQuestions = 0
        
    }
}

#Preview {
    ContentView()
}
    ////           Button("Show Alert") {
    ////               showingAlert = true
    ////           }
    //////           .alert("Important message", isPresented: $showingAlert) {
    //////               Button("OK") { }
    //////           }
    ////           .alert("Important message", isPresented: $showingAlert) {
    ////               Button("Delete", role: .destructive) { }
    ////               Button("Cancel", role: .cancel) { }
    ////           }
    //           Button("Show Alert") {
    //               showingAlert = true
    //           }
    //           .alert("Important message", isPresented: $showingAlert) {
    //               Button("OK", role: .cancel) { }
    //           } message: {
    //               Text("Please read this.")
    //           }
    //       }
        
    //    var body: some View {
            //        LinearGradient(stops: [
            ////            Gradient.Stop(color: .white, location: 0.45),
            ////            Gradient.Stop(color: .black, location: 0.55),
            //            .init(color: .white, location: 0.45),
            //            .init(color: .black, location: 0.55),
            //        ], startPoint: .top, endPoint: .bottom)
            //        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            //        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
    //        Text("Your content")
    //            .frame(maxWidth: .infinity,maxHeight: .infinity)
    //            .foregroundStyle(.white)
    //            .background(.indigo
    //                .gradient)
            
    //        Button("Delete selection", role: .destructive, action: executeDelete)
            
    //        VStack {
    //            Button("Button 1") { }
    //                .buttonStyle(.bordered)
    //            Button("Button 2", role: .destructive) { }
    //                .buttonStyle(.bordered)
    //            Button("Button 3") { }
    //                .buttonStyle(.borderedProminent)
    //                .tint(.mint)
    //            Button("Button 4", role: .destructive) { }
    //                .buttonStyle(.borderedProminent)
    //        }
            
    //        Button {
    //            print("Button was tapped")
    //        } label: {
    //            Text("Tap me!")
    //                .padding()
    //                .foregroundStyle(.white)
    //                .background(.red)
    //        }
            
            
    //        Button {
    //            print("Edit button was tapped")
    //        } label: {
    //            Image(systemName: "pencil")
    //        }
    //
    //        Button("Edit", systemImage: "pencil") {
    //            print("Edit button was tapped")
    //        }
            
    //        Button {
    //            print("Edit button was tapped")
    //        } label: {
    //            Label("Edit", systemImage: "pencil")
    //                .padding()
    //                .foregroundStyle(.white)
    //                .background(.red)
    //        }
    //    }
        //        ZStack {
        //            //            Color(red: 1, green: 0.8, blue: 0)
        //            //            Text("Hello, world!")
        //            //        }
        //            //        .ignoresSafeArea()
        //            VStack(spacing: 0) {
        //                Color.red
        //                Color.blue
        //            }
        //            Text("Your content")
        //                .foregroundStyle(.secondary)
        //                .padding(50)
        //                .background(.ultraThinMaterial)
        //        }
        //                .ignoresSafeArea()
        //    }
        
    //    func executeDelete(){
    //        print("Now deleting...")
    //    }
