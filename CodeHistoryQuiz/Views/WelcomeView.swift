//
//  WelcomeView.swift
//  CodeHistoryQuiz
//
//  Created by Sebastian on 5/18/24.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                GameColor.mainColor.ignoresSafeArea()
                
                VStack {
                    Text("Code History Quiz")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.top, 40)
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("• There are 10 questions per game").padding()
                        Text("• Each round is multiple choice").padding()
                        Text("• You have unlimited time").padding()
                    }
                    
                    Spacer()
                    NavigationLink(
                        destination: GameView(),
                        label: {
                            HStack {
                                Spacer()
                                Text("Okay, let's go!")
                                    .font(.body)
                                    .bold()
                                    .padding()
                                Spacer()
                            }.background(GameColor.accentColor)
                        })
                }
            }.foregroundColor(.white)
        }
    }
}

#Preview {
    WelcomeView()
}
