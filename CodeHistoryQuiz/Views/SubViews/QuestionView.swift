//
//  QuestionView.swift
//  CodeHistoryQuiz
//
//  Created by Sebastian on 5/19/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var viewModel: GameViewModel
    @State var count = 0;
    
    let question: Question
    
    var body: some View {
        VStack{
            Text(question.questionText)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading).padding()
            Spacer()
            HStack{
                ForEach(0..<question.possibleAnswers.count, id: \.self)
                { answerIndex in
                    Button(action: {
                        viewModel.makeAttempt(answerIndex)
                        print("Tapped on \(question.possibleAnswers[answerIndex])")
                        if question.correctAnswerIndex == answerIndex
                        {
                            count += 1
                        }
                        
                    }, label: {
                        ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                            .background(viewModel.color(answerIndex));
                    }).disabled(viewModel.attemptWasMade).confettiCannon(counter: $count)
                }
            }
            if viewModel.attemptWasMade {
                Button(action: { viewModel.displayNextScreen() }) {
                    BottomTextView(str: "Next")
                }
            }
        }
    }
}

#Preview {
    QuestionView(question: Game().currentQuestion).environmentObject(GameViewModel())
}
