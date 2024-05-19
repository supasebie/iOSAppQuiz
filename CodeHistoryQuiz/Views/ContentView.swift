//
//  ContentView.swift
//  CodeHistoryQuiz
//
//  Created by Sebastian on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    @State private var counter: Int = 0
    
    @State var accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    let question = Question(questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"], correctAnswer: 0)
    
    var body: some View {
        ZStack{
            mainColor.ignoresSafeArea()
            VStack{
                Text("1/10")
                    .font(.callout)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding()
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack{
                    ForEach(0..<question.possibleAnswers.count, id: \.self) { answerIndex in
                        Button(action: {
                            print("Tapped on \(question.possibleAnswers[answerIndex])")
                            if answerIndex == question.correctAnswer {
                                counter+=1
                            } else {
                                mainColor = .red
                            }
                        }, label: {
                            ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                        }).confettiCannon(counter: $counter)
                    }
                }
            }
        }
        .foregroundColor(.white)
        
    }
}

#Preview {
    ContentView()
}
