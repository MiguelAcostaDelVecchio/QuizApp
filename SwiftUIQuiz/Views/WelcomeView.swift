//
//  WelcomeView.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 10/5/23.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack{
                GameColor().mainColor.ignoresSafeArea()
                VStack{
                    Text("SwiftUIQuizApp").font(.largeTitle).bold().padding()
                    Spacer()
                    Text("Select the correct answers to the following questions").font(.title).bold().padding()
                    Spacer()
                    NavigationLink(destination: GameView(), label: {ChoiceTextView(choiceText: "Okay let's gooo!")})
                    Spacer()
                }
                .foregroundColor(.white)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    WelcomeView()
}
