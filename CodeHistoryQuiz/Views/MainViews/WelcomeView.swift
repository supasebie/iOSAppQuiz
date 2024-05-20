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
                GameColor.main.ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Code History Quiz")
                            .font(.largeTitle)
                            .multilineTextAlignment(.leading)
                            .bold()
                            .padding(.top, 40)
                    }
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("• There are 10 questions per game").padding().font(.title3)
                        Text("• Each round is multiple choice").padding().font(.title3)
                        Text("• You have unlimited time").padding().font(.title3)
                    }
                    
                    Spacer()
                    NavigationLink(
                        destination: GameView(),
                        label: {
                            BottomTextView(str: "Ok Let's Go!")
                        })
                }
            }.foregroundColor(.white)
        }
    }
}

#Preview {
    WelcomeView()
}
