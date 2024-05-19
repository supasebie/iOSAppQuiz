//
//  ContentView.swift
//  CodeHistoryQuiz
//
//  Created by Sebastian on 5/15/24.
//

import SwiftUI

struct GameView: View {

    @State private var counter: Int = 0
    
    let question = Question(questionText: "What was the first computer bug?", possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"], correctAnswerIndex: 0)
    
    var body: some View {
        ZStack{
            GameColor.mainColor.ignoresSafeArea()
            VStack{
                Text("1/10")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
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
                            if answerIndex == question.correctAnswerIndex {
                                counter+=1
                            } else {
                                
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
    GameView()
}
